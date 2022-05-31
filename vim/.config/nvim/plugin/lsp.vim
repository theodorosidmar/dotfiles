nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.open_float()<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
inoremap <C-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>gp :lua vim.diagnostic.goto_prev()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
