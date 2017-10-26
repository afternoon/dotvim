"
" gvimrc (mainly for MacVim)
" Ben Godfrey <ben@ben2.com>
"

"" fullscreen on startup
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    set fullscreen
elseif has("win32") || has("win64")
    au GUIEnter * simalt ~x
endif

set guifont=Source\ Code\ Pro\ for\ Powerline:h14,Inconsolata\ for\ Powerline:h16,Meslo\ LG\ M\ DZ\ for\ Powerline:h14,Consolas_for_Powerline_FixedD:h11:cANSI,Consolas:h11,Monaco:h15

" hide toolbar by default
set guioptions=egmr

" nicer indent guide colours in the GUI
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guifg=#27292A guibg=#212324 ctermbg=235
hi IndentGuidesEven guifg=#212324 guibg=#27292A ctermbg=236

"
" A few Mac keybindings (I'm trying to ween myself from these)
"

" window control
map <silent> <D-w> <C-w>c

" tab movement
map <silent> <S-D-Left> :tabprevious<CR>
map <silent> <S-D-Right> :tabnext<CR>
imap <silent> <S-D-Left> <Esc>:tabprevious<CR>
imap <silent> <S-D-Right> <Esc>:tabnext<CR>
