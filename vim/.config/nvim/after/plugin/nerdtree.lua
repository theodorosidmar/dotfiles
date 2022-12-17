vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeGitStatusWithFlags = 1

vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>')
vim.keymap.set('n', '<C-b>', ':NERDTreeToggle<CR>')

vim.cmd [[
  autocmd FileType nerdtree setlocal relativenumber
]]
