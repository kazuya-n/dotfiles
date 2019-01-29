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

"$B0z?t$J$7$G(Bvim$B$r3+$$$?$i(BNERDTree$B$r5/F0!"(B
""$B0z?t$"$j$J$i(BNERDTree$B$O5/F0$;$:!"0z?t$GEO$5$l$?%U%!%$%k$r3+$/!#(B
autocmd vimenter * if !argc() | NERDTree | endif

"$BB>$N%P%C%U%!$r$9$Y$FJD$8$?;~$K(BNERDTree$B$,3+$$$F$$$?$i(BNERDTree$B$b0l=o$KJD$8$k!#(B
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Flake8
autocmd BufWritePost *.py call Flake8()
let g:flake8_quickfix_location="topleft" " Quickfix$B$N0LCV(B
let g:flake8_quickfix_height=7 " Quickfix$B$N9b$5(B
let g:flake8_show_in_gutter=1  " $B:8C<$K%7%s%\%k$rI=<((B
let g:flake8_show_in_file=1  " $B%U%!%$%kFb$K%^!<%/$rI=<((B
