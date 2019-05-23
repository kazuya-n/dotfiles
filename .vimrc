set t_Co=256
set conceallevel=3
colorscheme nord

call plug#begin('~/.cache/plugged')
    Plug 'ervandew/supertab'
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'nvie/vim-flake8', {'for': 'python'}
    Plug 'arcticicestudio/nord-vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    if has('nvim')
	    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
	    Plug 'Shougo/deoplete.nvim'
	    Plug 'roxma/nvim-yarp'
	    Plug 'roxma/vim-hug-neovim-rpc'
	endif
    Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

let g:deoplete#enable_at_startup = 1 
" deoplete

let g:indentLine_char = '>'

set guifont=DroidSansMono\ Nerd\ Font\ 14

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" jedivim
set completeopt=menuone                        " 補完候補を呼び出すとき常にポップアップメニューを使う

let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

set title
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

" Flake8
" automatically close quickfix if it's the only window left"
autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | quit | endif
autocmd BufWritePost *.py call Flake8()
let g:flake8_quickfix_location="topleft" " Quickfixの位置
let g:flake8_quickfix_height=7 " Quickfixの高さ
let g:flake8_show_in_gutter=1  " 左端にシンボルを表示
let g:flake8_show_in_file=1  " ファイル内にマークを表示

" NERDTree
autocmd FileType nerdtree setlocal nolist

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-e> :NERDTreeToggle<CR>

let g:NERDTreeDirArrows = 1
let NERDTreeWinSize=32
" let NERDTreeShowHidden = 1

"vim-nerdtree-syntax-highlight
let g:airline_powerline_fonts = 1

let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! HardMode ()
  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Right> <Nop>
endfunction

function! EasyMode ()
  noremap <Up> <Up>
  noremap <Down> <Down>
  noremap <Left> <Left>
  noremap <Right> <Right>
endfunction

command! HardMode call HardMode()
command! EasyMode call EasyMode()
