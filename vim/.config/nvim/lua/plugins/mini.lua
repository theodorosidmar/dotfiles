return { -- Collection of various small independent plugins/modules
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Pairs () [] {}
    require('mini.pairs').setup()

    -- Beauty
    require('mini.icons').setup()
    require('mini.tabline').setup()
    require('mini.statusline').setup()

    -- Comment
    require('mini.comment').setup {
      options = {
        ignore_blank_line = true,
      },
    }
  end,
}
