set nu
" Set color scheme

set t_Co=256
colorscheme molokai

call plug#begin('~/.cache/plugged')
    Plug 'davidhalter/jedi-vim', {'for': 'python'}
    Plug 'zchee/deoplete-jedi'
    Plug 'ervandew/supertab'
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
call plug#end()

let NERDTreeShowHidden = 1
let g:indentLine_char = '>'

nnoremap <silent><C-e> :NERDTreeToggle<CR>

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

set completeopt-=preview

let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set autoindent

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n" 
    :set term=xterm-256color 
    :syntax on 
endif
