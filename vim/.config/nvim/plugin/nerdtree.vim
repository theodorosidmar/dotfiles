let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers = 1
let g:NERDTreeGitStatusWithFlags = 1

map <C-f> :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>

autocmd FileType nerdtree setlocal relativenumber
