require('telescope').setup {
  defaults = vim.tbl_extend('force', require('telescope.themes').get_ivy(), {}),
  extensions = {
    fzf = {},
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
    ['file_browser'] = {
      -- Disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      hidden = {
        file_browser = true,
        folder_browser = true,
      },
    },
  },
}

-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'refactoring')
pcall(require('telescope').load_extension, 'zoxide')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Search grep using multigrep with pattern matching when using double spaces
vim.keymap.set('n', '<leader>sg', require 'config.multigrep', { desc = '[S]earch by [G]rep' })

-- Open file browser at project directory
vim.keymap.set('n', '<C-b>', ':Telescope file_browser<CR>')
-- Open file browser at current file directory
vim.keymap.set('n', '<C-f>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- Search for files in the current working directory
vim.keymap.set('n', '<leader>sf', function()
  builtin.find_files { hidden = true }
end, { desc = '[S]earch [F]iles' })
