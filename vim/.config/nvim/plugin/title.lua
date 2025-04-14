vim.o.title = true
vim.o.titlestring = 'nvim ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

vim.api.nvim_create_autocmd('DirChanged', {
  callback = function()
    vim.o.titlestring = 'nvim ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  end,
})
