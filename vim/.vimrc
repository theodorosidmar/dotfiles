let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:plug_timeout = 180

call plug#begin('~/.vim/plugged')
" Code completion & help
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" NERDTree
Plug 'scrooloose/nerdtree'
" NERDCommenter
Plug 'scrooloose/nerdcommenter'
" Status line
Plug 'vim-airline/vim-airline'
" Git
Plug 'tpope/vim-fugitive'
" Search content
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Gruvbox theme
Plug 'gruvbox-community/gruvbox'
" Syntax highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show hidden files
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
" Show line numbers on NERDTree
let NERDTreeShowLineNumbers=1
let g:NERDTreeGitStatusWithFlags = 1
" Ctrl f to open file in its directory
map <C-f> :NERDTreeFind<CR>
" Ctrl b to open & close NERDTree
map <C-b> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl / to comment in normal & visual mode
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>ps :Rg<SPACE>
if executable('rg')
  let g:rg_derive_root='true'
endif
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gs :G<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git
let g:coc_git_status=1
let b:coc_git_status=1

" Prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <cr>
  \ pumvisible() ? coc#_select_confirm() :
  \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Personal config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable netrwhist (annoying history collection)
let g:netrw_dirhistmax = 0

" jk is esc in insert mode
inoremap jk <ESC>

" Ctrl n creates a new empty file in vertical
map <C-n> :vnew<CR>

" <leader>q save all and quit
nnoremap <leader>q :wqa<CR>

" Add guideline 
set cursorline

" Highlight matching [{()}]
set showmatch

" Encoding
set encoding=UTF-8

" Show line numbers
set number relativenumber

" Auto indent
set autoindent

" Show a · in white spaces
set listchars=space:·
set list

" Show pressed commands below status line
set showcmd

" Indent with two spaces
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Splits and tabbed files
set splitright splitbelow

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <leader>tt opens terminal inside Vim
map <leader>tt :term<CR>

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" Change 2 split windows from vert to horiz or horiz to vert
" <leader>th changes to horizontal
" <leader>tk changes to vertical
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Ctrl arrows makes adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" J e K moves text select up & down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Set colorcolumn
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Fucking bullshit which doest not lemme exit Vim
autocmd FileType netrw setl bufhidden=delete
