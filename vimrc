"
" vimrc
" Ben Godfrey <ben@ben2.com>
"

" be iMproved
set nocompatible

" required for vundle
filetype off

" init vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" add vundle as a bundle for updating/to prevent cleaning
Bundle 'gmarik/vundle'

" BUNDLES!!
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tyok/nerdtree-ack'
Bundle 'Phize/QFixToggle'
Bundle 'vim-scripts/netrw.vim'

" fuzzy finding
"Bundle 'wincent/command-t'
Bundle 'kien/ctrlp.vim'

" autoclosing
"Bundle 'vim-scripts/AutoClose'
Bundle 'Raimondi/delimitMate'

" colour schemes
Bundle 'afternoon/molokai'

" syntax highlighting bundles
Bundle 'afternoon/ini-syntax-definition'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'elzr/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/Puppet-Syntax-Highlighting'
Bundle 'vim-scripts/httplog'
Bundle 'vim-scripts/n3.vim'
Bundle 'vim-scripts/nginx.vim'

" new and potentially deadly
Bundle 'bling/vim-airline'
"Bundle 'mhinz/vim-startify'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'tpope/vim-abolish'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'Valloric/YouCompleteMe'

" enable filetype magic
filetype plugin indent on

" mac-user equivalent of a hair shirt
" (just trying to get my hands on the home row)
noremap <left> <nop>
noremap <down> <nop>
noremap <right> <nop>
noremap <up> <nop>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

" use bash as shell for now, seems a bit more reliable, esp. with fugitive
set shell=bash

" turn on syntax highlighting
syntax on

" remap leader
let mapleader = ","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show command mode autocomplete matches
set wildmenu
set wildmode=longest,full

" show current position
set ruler

" searching/substitution
set ignorecase
set incsearch
set hlsearch
set gdefault " global substitute by default
set showmatch

" command editing
set showcmd		    " display incomplete commands
set cmdwinheight=20 " big window for command history (q:, q/, q?)

" disable line wrapping by default
set nowrap

" enable line numbers
set number

" backup and autosave
set backupcopy=yes
set autowrite
set autowriteall

" check for mac newlines
set ffs+=mac

" tabs, hard line wrapping, indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set formatoptions=tcoqn
set nojoinspaces

" don't redraw screen while running macros (increase speed)
set lazyredraw

" line numbers
set number

" line length fascism
set textwidth=80
if exists("&colorcolumn")
    set colorcolumn=+1
    hi ColorColumn ctermbg=black ctermfg=red
endif

" encoding settings
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

" include dictionary files and tags in autocomplete scanning
set complete =.,w,b,u,t,i,k,]

" supertab
let g:SuperTabDefaultCompletionType = "context"

" HTML generation
let html_use_css="yay"

" allow windows to be different sizes - required for Project/NERDTree plugins
" to stay sane
set noequalalways

" Snippets plugin
let g:snip_start_tag = "@"
let g:snip_end_tag = "@"

" read first 10 lines for modelines
set modelines=10

" show search results in the centre of the window
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" omni!
set completeopt=menu
set omnifunc=syntaxcomplete#Complete

" ack mappings, ,A to search, ,k to search for word under cursor
noremap <leader>a :Ack<Space>
noremap <leader>A viw"zy:exe "Ack '" . @z . "'"<CR>

" Don't bind ,ac to AutoClose (makes response to ,a faster)
nnoremap <unique> <Leader>toggleautoclose <Plug>ToggleAutoCloseMappings

" move through quickfix list
noremap <leader>f :QFix<CR>

" window management
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>c <C-W>c
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" shortcuts for deleting, saving, etc
nnoremap <leader>q :wqa!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader><Esc> :q!<CR>
nnoremap <leader>d :bd!<CR>
nnoremap <leader>D :bufdo bd<CR>

" sort
noremap <leader>S :sort<CR>
noremap <leader>U :sort u<CR>

" fix whitespace
nnoremap <leader>fw :FixWhitespace<CR>

" hide search highlighting
nnoremap <leader>l :nohl<CR>

" bind make to F5, like those other IDEs we don't name
nnoremap <F5> :make<CR>

" sudo make me a sandwich
cnoremap <leader>W %!sudo tee > /dev/null %

" thesaurus
if filereadable(expand("$HOME/.vim/mthesaur.txt"))
    set thesaurus=$HOME/.vim/mthesaur.txt
endif

" NERDTree
let NERDTreeDirArrows=0
let NERDTreeIgnore=[
            \ '\(lib\|vendor\|node_modules\|bower_components\|deps\|package\|trigger_package\)$[[dir]]',
            \ '\(build\|ebin\|target\)$[[dir]]',
            \ '\.py[co]$[[file]]',
            \ '\~$[[file]]',
            \ '\.\(class\|beam\|o\)$[[file]]',
            \ '\.\(jpg\|png\|gif\|pdf\|ico\|JPG\|PNG\|GIF\|PDF\|ICO\)$[[file]]'
            \]
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>b :NERDTreeFromBookmark<space>

" triple quotes
inoremap ''' ''''''<Esc>2hi
inoremap """ """"""<Esc>2hi

" keep visual selection after indent
vnoremap > >gv
vnoremap < <gv

" ctrlp
let g:ctrlp_custom_ignore = {"dir": "node_modules"}
let g:ctrlp_custom_ignore = {"dir": "app\/build"}
let g:ctrlp_custom_ignore = {"dir": "app\/package"}

" syntastic
" ignore angular directive attributes
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-']

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" Local machine settings
if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
