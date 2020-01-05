if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'        " NERDTree
Plug 'ryanoasis/vim-devicons'     " vim-devicons
Plug 'vim-airline/vim-airline'    " vim-arline statusline
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' } " YouCompleteMe
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' } " fzf
Plug 'junegunn/fzf.vim' " fzf
call plug#end()

" NERDTREE config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Disable netrwhist (annoying history collection)
let g:netrw_dirhistmax = 0

" fzf
map <C-p> :call fzf#run({'sink': 'e'})<CR>
nnoremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>

set encoding=UTF-8
set number
set relativenumber
set autoindent
set hidden
