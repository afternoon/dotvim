"
" vimrc
" Ben Godfrey <ben@ben2.com>
"

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

" this could be useful ;-)
set nocompatible

" use bash as shell for now, seems a bit more reliable, esp. with fugitive
set shell=bash

" activate pathogen and filetype plugins and indenting
filetype off
call pathogen#infect()
filetype plugin indent on

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
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType sql set omnifunc=sqlcomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" Don't bind ,ac to AutoClose
nnoremap <unique> <Leader>toggleautoclose <Plug>ToggleAutoCloseMappings

" comment lines with ,/
noremap <leader>/ :TComment<CR>

" ack mappings, ,A to search, ,k to search for word under cursor
noremap <leader>a :Ack<Space>
noremap <leader>A viw"zy:exe "Ack '" . @z . "'"<CR>

" move through quickfix list
noremap <leader>j :cnext<CR>
noremap <leader>k :cprevious<CR>

" window management
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>c <C-W>c
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" shortcuts for deleting, saving, etc"
nnoremap <leader>q :wqa!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader><Esc> :q!<CR>
nnoremap <leader>d :bd!<CR>
nnoremap <leader>D :bufdo bd<CR>

" tabularize
nnoremap <leader>T= :Tabularize /=<CR>
vnoremap <leader>T= :Tabularize /=<CR>
nnoremap <leader>T=> :Tabularize /=><CR>
vnoremap <leader>T=> :Tabularize /=><CR>
nnoremap <leader>T: :Tabularize /:\zs<CR>
vnoremap <leader>T: :Tabularize /:\zs<CR>

" sort
noremap <leader>s :sort<CR>
noremap <leader>u :sort u<CR>

" gundo
let g:gundo_right = 1
let g:gundo_preview_height = 50

" fix whitespace
nnoremap <leader>fw :FixWhitespace<CR>

" hide search highlighting
nnoremap <leader>l :nohl<CR>

" bind make to F5, like those other IDEs we don't name
nnoremap <F5> :make<CR>

" ref
let g:ref_use_vimproc = "true"

" sudo make me a sandwich
cnoremap w!! %!sudo tee > /dev/null %

" thesaurus
if filereadable(expand("$HOME/.vim/mthesaur.txt"))
    set thesaurus=$HOME/.vim/mthesaur.txt
endif

" NERDTree
let NERDTreeDirArrows=0
let NERDTreeIgnore=['\(lib\|vendor\|node_modules\|deps\)$[[dir]]', '\(build\|ebin\|target\)$[[dir]]', '\.py[co]$[[file]]', '\~$[[file]]', '\.\(class\|beam\|o\)$[[file]]', '\.\(jpg\|png\|gif\|pdf\|ico\|JPG\|PNG\|GIF\|PDF\|ICO\)$[[file]]']
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

nnoremap <leader>n :NERDTreeToggle<CR>

" open NERDTree bookmark - trailing space is important!
nnoremap <leader>b :NERDTreeFromBookmark 

" triple quotes
inoremap ''' ''''''<Esc>2hi
inoremap """ """"""<Esc>2hi

" format XML and JSON
nnoremap <leader>px :%!xmllint --format %<CR>
nnoremap <leader>pj :%!python -mjson.tool<CR>:FixWhitespace<CR>

" keep visual selection after indent
vnoremap > >gv
vnoremap < <gv

" Text object for PHP-style functions
onoremap af aBj$o?function<CR>0

" Local machine settings
if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
