"
" gvimrc (mainly for MacVim)
" Ben Godfrey <ben@ben2.com>
"

" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

"
" Global default options
"

if !exists("syntax_on")
    syntax on
endif

" To make tabs more readable, the label only contains the tail of the file
" name and the buffer modified flag.
set guitablabel=%M%t

" Send print jobs to Preview.app.  This does not delete the temporary ps file
" that is generated by :hardcopy.
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error

" This is so that HIG Cmd and Option movement mappings can be disabled by
" adding the line
"   let macvim_skip_cmd_opt_movement = 1
" to the user .vimrc
"
if !exists("macvim_skip_cmd_opt_movement")
    no   <D-Left>       <Home>
    no!  <D-Left>       <Home>
    no   <M-Left>       <C-Left>
    no!  <M-Left>       <C-Left>

    no   <D-Right>      <End>
    no!  <D-Right>      <End>
    no   <M-Right>      <C-Right>
    no!  <M-Right>      <C-Right>

    no   <D-Up>         <C-Home>
    ino  <D-Up>         <C-Home>
    map  <M-Up>         {
    imap <M-Up>         <C-o>{

    no   <D-Down>       <C-End>
    ino  <D-Down>       <C-End>
    map  <M-Down>       }
    imap <M-Down>       <C-o>}

    imap <M-BS>         <C-w>
    imap <D-BS>         <C-u>
endif " !exists("macvim_skip_cmd_opt_movement")

" This is so that the HIG shift movement related settings can be enabled by
" adding the line
"   let macvim_hig_shift_movement = 1
" to the user .vimrc (not .gvimrc!).
"
if exists("macvim_hig_shift_movement")
    " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
    set selectmode=mouse,key
    set keymodel=startsel,stopsel

    " HIG related shift + special movement key mappings
    nn   <S-D-Left>     <S-Home>
    vn   <S-D-Left>     <S-Home>
    ino  <S-D-Left>     <S-Home>
    nn   <S-M-Left>     <S-C-Left>
    vn   <S-M-Left>     <S-C-Left>
    ino  <S-M-Left>     <S-C-Left>

    nn   <S-D-Right>    <S-End>
    vn   <S-D-Right>    <S-End>
    ino  <S-D-Right>    <S-End>
    nn   <S-M-Right>    <S-C-Right>
    vn   <S-M-Right>    <S-C-Right>
    ino  <S-M-Right>    <S-C-Right>

    nn   <S-D-Up>       <S-C-Home>
    vn   <S-D-Up>       <S-C-Home>
    ino  <S-D-Up>       <S-C-Home>

    nn   <S-D-Down>     <S-C-End>
    vn   <S-D-Down>     <S-C-End>
    ino  <S-D-Down>     <S-C-End>
endif " exists("macvim_hig_shift_movement")

" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save

"
" Local settings for Ben Godfrey
"

set guioptions=egmr " hide toolbar by default
set linespace=1
set lines=76
set columns=235

set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h13
set fuoptions=maxvert,maxhorz

"
" Custom menus
"

" Add a Preferences... menu item to the Edit menu.
amenu File.Edit\ vimrc :tabedit ~/.vimrc<CR>
amenu File.Edit\ gvimrc :tabedit ~/.gvimrc<CR>
amenu File.-SepPrefs- :

" add some shortcuts to menus
amenu PopUp.-Sep- :
amenu PopUp.Keyword\ Lookup K
amenu PopUp.Open\ Filename\ Under\ Cursor gf

" open project menu item
amenu 10.326 File.-SepPrefs- :
amenu 10.327 File.Projects :Proj<CR>

"
" Keys
"

" word delete
map <silent> <M-BS> db
imap <silent> <M-BS> <Esc>ldbi
map <silent> <M-Del> dw
imap <silent> <M-Del> <Esc>ldwi

" buffer movement
map <silent> <S-M-Left> :bprev<CR>
map <silent> <S-M-Right> :bnext<CR>
imap <silent> <S-M-Left> <Esc>:bprev<CR>
imap <silent> <S-M-Right> <Esc>:bnext<CR>

if has("gui_macvim")
    " window control
    map <silent> <D-w> <C-w>c

    " hide highlighting
    map <silent> <D-H> :nohl<CR>
    imap <silent> <D-H> <Esc>:nohl<CR>a

    " tab movement
    map <silent> <S-D-Left> :tabprevious<CR>
    map <silent> <S-D-Right> :tabnext<CR>
    imap <silent> <S-D-Left> <Esc>:tabprevious<CR>
    imap <silent> <S-D-Right> <Esc>:tabnext<CR>

    " indent/outdent as TextMate et al
"    map <silent> <D-]> >>
"    imap <silent> <D-]> <Esc>>>a
"    vmap <silent> <D-]> >
"    map <silent> <D-[> <Lt><Lt>
"    imap <silent> <D-[> <Esc><Lt><Lt>a
"    vmap <silent> <D-[> <Lt>

    " <D-8> to set window width to 80 chars
    map <silent> <D-8> :vertical resize 80<CR>
    imap <silent> <D-8> <Esc>:vertical resize 80<CR>

    " Fullscreen
    map <silent> <D-F> :set invfullscreen<CR>

    " move lines up and down and reindent correctly (clashes with quickfix menu
    " mappings in runtime/menu.vim, so we remove those mappings first)
    macm Tools.Older\ List key=<nop>
    macm Tools.Newer\ List key=<nop>
    nnoremap <D-C-Up> V:move '<-2<CR>gv=
    nnoremap <D-C-Down> V:move '>+1<CR>gv=
    vnoremap <D-C-Up> :move '<-2<CR>gv=gv
    vnoremap <D-C-Down> :move '>+1<CR>gv=gv
endif

" Update ctags
map <silent> <F3> :!ctags -R --exclude=.svn --exclude=.git --exclude=log *<CR>

"
" Local machine settings
"
if filereadable(expand("$HOME/.gvimrc.local"))
    source $HOME/.gvimrc.local
endif
