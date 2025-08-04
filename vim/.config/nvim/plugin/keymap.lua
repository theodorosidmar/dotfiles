-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]] See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers and relative numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1 }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Use `jk` to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- Use CTRL+n to create a new empty file
vim.keymap.set('n', '<C-n>', vim.cmd.vnew)

-- Use `J` and `K` to move lines up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Resize windows with CTRL+arrow left/right
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>', { silent = true })
vim.keymap.set('n', '<C-Up>', ':horizontal resize +3<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':horizontal resize -3<CR>', { silent = true })

-- Walk through quick fix list with CTRL+k/j
vim.keymap.set('n', '<C-w>k', '<cmd>cnext<CR>zz', { desc = 'Go to the next file in the quick fix list' })
vim.keymap.set('n', '<C-w>j', '<cmd>cprev<CR>zz', { desc = 'Go to the previous file in the quick fix list' })

-- Walk through location list with CTRL+h/l
vim.keymap.set('n', '<C-w>l', '<cmd>lnext<CR>zz', { desc = 'Go to the next file in the location list' })
vim.keymap.set('n', '<C-w>h', '<cmd>lprev<CR>zz', { desc = 'Go to the previous file in the location list' })

-- Join the current line with the following line with `J` in normal mode
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep the cursor in the middle of the screen while scrolling up or down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- I don't recall what these do. Sorry
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste in visual mode, but don't save the deleted content to the register
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete but don't save it to the register
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Substitute the current word at your cursor
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Run `chmod +x` with `<leader>x`
vim.keymap.set('n', '<leader>X', '<cmd>!chmod +x %<CR>', { silent = true })

-- Execute lua code
vim.keymap.set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })
