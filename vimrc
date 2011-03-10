"
" vimrc
" Ben Godfrey <ben@ben2.com>
"

" this could be useful ;-)
set nocompatible

" use bash as shell for now, seems a bit more reliable, esp. with fugitive
set shell=bash

" activate pathogen and filetype plugins and indenting
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" turn on syntax highlighting
syntax on

" remap local leader
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

" line length fascism
set textwidth=80
set colorcolumn=+0
hi ColorColumn ctermbg=black ctermfg=red

" encoding settings
set termencoding=macroman
set fileencoding=utf-8
set encoding=utf-8

" default keyword prog is just Google it
set keywordprg=~/Documents/bin/google.py

" include dictionary files and tags in autocomplete scanning
set complete =.,w,b,u,t,i,k,]

" supertab
let g:SuperTabDefaultCompletionType = "context"

" HTML generation
let html_use_css="yay"

" Project plugin
let g:proj_flags = "Lmst"
let g:proj_window_width = 37
let g:proj_window_increment = 37

" allow windows to be different sizes - required for Project plug in to stay
" sane
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

" ,ac to AutoClose
nmap <unique> <Leader>autoc <Plug>ToggleAutoCloseMappings

" comment lines with ,/
map <Leader>/ :TComment<CR>

" comment lines with ,/
map <Leader>A :Ack<Space>

" window management
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>c <C-W>c
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>p :Proj<CR>

" shortcuts for deleting, saving, etc"
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bd!<CR>
nmap <leader>n :bufdo bd<CR>

" tabularize
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

" sort
map <Leader>s :!sort<CR>

" gundo
let g:gundo_right = 1
let g:gundo_preview_height = 50
nnoremap <Leader>u :GundoToggle<CR>

" fix whitespace
nnoremap <Leader>fw :FixWhitespace<CR>

nnoremap <F5> :make<CR>
"
" Text objects
"

" PHP-style functions
map af aBj$o?function<CR>0
