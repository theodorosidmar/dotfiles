return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-frappe'
    vim.cmd.hi 'Comment gui=none'
  end,
}
