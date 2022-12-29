vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('n', '<leader>q', ':wqa<CR>')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<C-n>', vim.cmd.vnew)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>', { silent = true })

vim.keymap.set('n', '<C-w>k', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-w>j', '<cmd>cprev<CR>zz')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
