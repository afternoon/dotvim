"
" vimrc
" Ben Godfrey <ben@ben2.com>
"

" be iMproved
set nocompatible

" required for vundle
filetype off

" init vundle
if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  call vundle#begin('~/vimfiles/bundle')
else
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
endif

" add vundle as a bundle for updating/to prevent cleaning
Plugin 'VundleVim/Vundle.vim'

" autocompletion powerhouse
Plugin 'Valloric/YouCompleteMe'

" tab autocomplete
Plugin 'ervandew/supertab'

" tpope has a posse
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" BLING RULER PRO
Plugin 'vim-airline/vim-airline'

" syntax checking
Plugin 'vim-syntastic/syntastic'

" fuzzy finding
Plugin 'ctrlpvim/ctrlp.vim'

" autoclosing
Plugin 'jiangmiao/auto-pairs'

" sublime-style multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" toggle quickfix window open/closed
Plugin 'Phize/QFixToggle'

" colour schemes
Plugin 'afternoon/molokai'

" highlight trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'

" match start/end pairs with with handy indent bars
Plugin 'nathanaelkane/vim-indent-guides'

" language bundles
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'

" garbas' snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

" NERDTree browser
"Plugin 'scrooloose/nerdtree'
"Plugin 'taiansu/nerdtree-ag'

" others
"Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'rking/ag.vim'
"Plugin 'sukima/xmledit'
"Plugin 'vim-scripts/netrw.vim'
"Plugin 'majutsushi/tagbar'

" CamelCaseMotion - mappings must be defined before plugin startup
map <silent> -w <Plug>CamelCaseMotion_w
map <silent> -b <Plug>CamelCaseMotion_b
map <silent> -e <Plug>CamelCaseMotion_e
omap <silent> i-w <Plug>CamelCaseMotion_iw
xmap <silent> i-w <Plug>CamelCaseMotion_iw
omap <silent> i-b <Plug>CamelCaseMotion_ib
xmap <silent> i-b <Plug>CamelCaseMotion_ib
omap <silent> i-e <Plug>CamelCaseMotion_ie
xmap <silent> i-e <Plug>CamelCaseMotion_ie
Plugin 'bkad/CamelCaseMotion'

" vundle plugins all defined
call vundle#end()

" enable filetype magic
filetype plugin indent on

" turn on syntax highlighting
syntax on

" FB Vim config
if filereadable($LOCAL_ADMIN_SCRIPTS . "/master.vimrc")
  source $LOCAL_ADMIN_SCRIPTS/master.vimrc
  source $LOCAL_ADMIN_SCRIPTS/vim/biggrep.vim
  source $LOCAL_ADMIN_SCRIPTS/vim/filetype.vim
  source $LOCAL_ADMIN_SCRIPTS/vim/fbvim.vim
endif

" default colorscheme
set background=dark
colorscheme molokai

" remap leader
let mapleader=","

" mouse magic
set mouse=a

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show current position
set ruler

" searching/substitution
set ignorecase
set incsearch
set hlsearch
set gdefault " global substitute by default
set showmatch

" command editing
set showcmd	" display incomplete commands
set cmdwinheight=20 " big window for command history (q:, q/, q?)

" disable line wrapping by default
set nowrap

" enable line numbers
set number

" read file if changed outside vim
set autoread

" backup and autosave
set backupcopy=yes
set autowrite
set autowriteall

" show command mode autocomplete matches
set wildmenu
set wildmode=longest,full
set wildignore+=*.so,*.swp,*.py[co]

" tabs, hard line wrapping, indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set formatoptions=tcoqn
set nojoinspaces
set smarttab

" line numbers
set number

" line length fascism
set textwidth=80
if exists("&colorcolumn")
  set colorcolumn=+1
  hi ColorColumn ctermbg=black ctermfg=red
endif

" tab fascism
syn match tab display "\t"
hi link tab Error

" encoding settings
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

" supertab
"let g:SuperTabDefaultCompletionType="context"

" allow windows to be different sizes - required for Project/NERDTree plugins
" to stay sane
set noequalalways

" show search results in the centre of the window
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" omni!
"set completeopt=menu
"set omnifunc=syntaxcomplete#Complete

" ack mappings, ,A to search, ,k to search for word under cursor
"noremap <leader>a :Ag<Space>
"noremap <Leader>k :Ag <cword><CR>

" Don't bind ,ac to AutoClose (makes response to ,a faster)
"if maparg("<leader>toggleautoclose", "n") == ""
"    nnoremap <unique> <leader>toggleautoclose <Plug>ToggleAutoCloseMappings
"endif

" toggle quickfix list
noremap <leader>x :QFix<CR>

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

" sudo make me a sandwich
cnoremap <leader>W %!sudo tee > /dev/null %

" NERDTree
let NERDTreeDirArrows=1
let NERDTreeIgnore=[
  \ '\(vendor\|node_modules\|deps\|build\|package\|tmp\|coverage\)$[[dir]]',
  \ '\(build\|ebin\|target\|__pycache__\)$[[dir]]',
  \ '\.py[co]$[[file]]',
  \ '\~$[[file]]',
  \ '\.\(class\|beam\|o\)$[[file]]',
  \ '\.\(jpg\|png\|gif\|pdf\|ico\|JPG\|PNG\|GIF\|PDF\|ICO\)$[[file]]'
  \]
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>
nnoremap <leader>b :NERDTreeFromBookmark<space>

" keep visual selection after indent
vnoremap > >gv
vnoremap < <gv

" ctrlp
let g:ctrlp_open_new_file="v"
let g:ctrlp_open_multiple_files="v"
let g:ctrlp_extensions=['tag']
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules)$',
  \}

" colour lines with syntastic errors and warnings
let g:syntastic_enable_signs=1
highlight SyntasticErrorLine guibg=#550000
highlight SyntasticWarningLine guibg=#331d1e

" use python 3 for syntastic python checks
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_flake8_exec='python3'

" airline
set laststatus=2
let g:airline_powerline_fonts=1

" indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_exclude_filetypes=['help', 'nerdtree']
let g:indent_guides_auto_colors=0
" let g:indent_guides_guide_size=1
highlight IndentGuidesOdd  ctermbg=233
highlight IndentGuidesEven ctermbg=234

" tagbar
"nnoremap <silent> <Leader>b :TagbarToggle<CR>

" paste toggle shortcut
"set pastetoggle=<F2>
nnoremap <leader>p :set invpaste<CR>

" format JSON
nnoremap <silent> <Leader>jf :%!python -m json.tool<CR>

" Apply vim-jsx to .js files
let g:jsx_ext_required=0

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_identifier_candidate_chars=4
let g:ycm_error_symbol='x'
let g:ycm_warning_symbol='!'

nnoremap <leader>y :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
