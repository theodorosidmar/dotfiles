require("theodorosidmar.set")
require("theodorosidmar.remap")

local autocmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup
local mygroup = augroup('theodorosidmar', {})
local yankgroup = augroup('HighlightYank', {})

autocmd("BufWritePre", {
    group = mygroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd('TextYankPost', {
    group = yankgroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
