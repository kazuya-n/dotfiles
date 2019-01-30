set nu
" Set color scheme

set t_Co=256
colorscheme nord

call plug#begin('~/.cache/plugged')
    Plug 'davidhalter/jedi-vim', {'for': 'python'}
    Plug 'zchee/deoplete-jedi'
    Plug 'ervandew/supertab'
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'nvie/vim-flake8', {'for': 'python'}
    Plug 'arcticicestudio/nord-vim'
call plug#end()

let NERDTreeShowHidden = 1
let g:indentLine_char = '>'

nnoremap <silent><C-e> :NERDTreeToggle<CR>

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" jedivim
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0

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

"引数なしでvimを開いたらNERDTreeを起動、
""引数ありならNERDTreeは起動せず、引数で渡されたファイルを開く。
autocmd vimenter * if !argc() | NERDTree | endif

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Flake8
" automatically close quickfix if it's the only window left"
autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | quit | endif
autocmd BufWritePost *.py call Flake8()
let g:flake8_quickfix_location="topleft" " Quickfixの位置
let g:flake8_quickfix_height=7 " Quickfixの高さ
let g:flake8_show_in_gutter=1  " 左端にシンボルを表示
let g:flake8_show_in_file=1  " ファイル内にマークを表示
