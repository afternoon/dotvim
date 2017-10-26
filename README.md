afternoon/dotvim
================

- Uses Vundle
- Is designed for MacVim (though other Vims should mostly work)
- Maps lots of stuff with `<leader>`
- Has been evolving for a while and is probably crufty

See top of `vimrc` for the bundle list.

Install
-------

```bash
git clone https://github.com/afternoon/dotvim ~/.vim # or ~/vimfiles for Windows
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/Vundle.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
vim +BundleInstall +qall
```
