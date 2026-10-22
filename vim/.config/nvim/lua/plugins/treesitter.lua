-- Highlight, edit, and navigate code
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      local ts = require 'nvim-treesitter'

      local available = {}
      for _, lang in ipairs(ts.get_available()) do
        available[lang] = true
      end

      -- Start highlighting, autoinstalling languages that are not installed
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match)
          if not lang or not available[lang] then
            return
          end

          local start = function()
            if vim.api.nvim_buf_is_valid(event.buf) then
              pcall(vim.treesitter.start, event.buf, lang)
            end
          end

          if vim.list_contains(ts.get_installed(), lang) then
            start()
          else
            ts.install(lang):await(vim.schedule_wrap(start))
          end
        end,
      })

      -- Incremental selection, using the built-in `an` and `in` (see `:help v_an`)
      vim.keymap.set('n', '<c-space>', 'van', { remap = true, desc = 'Start node selection' })
      vim.keymap.set('x', '<c-space>', 'an', { remap = true, desc = 'Expand node selection' })
      vim.keymap.set('x', '<c-backspace>', 'in', { remap = true, desc = 'Shrink node selection' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      -- Disable built-in ftplugin mappings (e.g. `]]`, `]m`) so they don't override the ones below
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        },
        move = {
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      }

      -- You can use the capture groups defined in textobjects.scm
      local select = require 'nvim-treesitter-textobjects.select'
      for keys, query in pairs {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      } do
        vim.keymap.set({ 'x', 'o' }, keys, function()
          select.select_textobject(query, 'textobjects')
        end, { desc = 'Select ' .. query })
      end

      local move = require 'nvim-treesitter-textobjects.move'
      for method, maps in pairs {
        goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
        goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
        goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
        goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
      } do
        for keys, query in pairs(maps) do
          vim.keymap.set({ 'n', 'x', 'o' }, keys, function()
            move[method](query, 'textobjects')
          end, { desc = method:gsub('_', ' ') .. ' ' .. query })
        end
      end
    end,
  },
}
