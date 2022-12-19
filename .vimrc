set nocompatible
filetype off

" set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()

" Plugin 'VundleVim/Vundle.vim'

" Plugin 'ycm-core/YouCompleteMe'
" let g:ycm_filetype_whitelist= {'c': 1, 'py': 1, 'cpp': 1, 'java': 1, 'sml': 1}

" call vundle#end()

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
let g:UltiSnipExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'tmsvg/pear-tree'

call plug#end()

set tabstop=4
set shiftwidth=4
set number
filetype plugin indent on
set autoindent
set wildmenu
set wildmode=longest:list,full
set expandtab

set hlsearch

set mouse=a

:autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
:autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
:autocmd BufNewFile *.html 0r ~/.vim/templates/template.html

" to fix tmux coloring issues
set background=dark
set t_Co=256

" :map <MiddleMouse> <Nop>
" :imap <MiddleMouse> <Nop>

" for python
" let python_highlight_all = 1
