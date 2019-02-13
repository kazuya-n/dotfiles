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
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'majutsushi/tagbar'
call plug#end()

let NERDTreeShowHidden = 1
let g:indentLine_char = '>'

set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" jedivim
set completeopt=menuone                        " $BJd408uJd$r8F$S=P$9$H$->o$K%]%C%W%"%C%W%a%K%e!<$r;H$&(B
let g:jedi#popup_on_dot           = 0 " $B%I%C%H(B(.)$B$rF~NO$7$?$H$-<+F0$GJd40$7$J$$(B
let g:jedi#popup_select_first     = 0 " $BJd408uJd$N(B1$BHVL\$rA*Br$7$J$$(B
let g:jedi#show_call_signatures   = 0 " $B4X?t$N0z?tI=<($rL58z(B($B%]%C%W%"%C%W$N%P%0$rF'$s$@$3$H$,$"$k$?$a(B)
autocmd FileType python setlocal omnifunc=jedi#completions   " $BJd40%(%s%8%s$O(Bjedi$B$r;H$&(B

let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

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
" automatically close quickfix if it's the only window left"
autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | quit | endif
autocmd BufWritePost *.py call Flake8()
let g:flake8_quickfix_location="topleft" " Quickfix$B$N0LCV(B
let g:flake8_quickfix_height=7 " Quickfix$B$N9b$5(B
let g:flake8_show_in_gutter=1  " $B:8C<$K%7%s%\%k$rI=<((B
let g:flake8_show_in_file=1  " $B%U%!%$%kFb$K%^!<%/$rI=<((B
