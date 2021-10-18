set completeopt=menuone,noinsert,noselect

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
  local nvim_lsp = require('lspconfig')
  local completion_on_attach = require'completion'.on_attach

  nvim_lsp.tsserver.setup { on_attach = completion_on_attach }
  nvim_lsp.kotlin_language_server.setup {
    on_attach = completion_on_attach,
    cmd = { '/home/theodorosidmar/.kotlin/kotlin-language-server/server/build/install/server/bin/kotlin-language-server' },
  }
EOF
