nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
