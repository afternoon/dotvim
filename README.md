afternoon/dotvim
================

- Uses Vundle
- Is designed for MacVim (though other Vims should mostly work)
- Maps lots of stuff with `<leader>`
- Has been evolving for a while and is probably crufty
- Doesn't have great autocomplete (buffer only, nothing clever)

See top of `vimrc` for the bundle list.

Install
-------

```bash
git clone https://github.com/afternoon/dotvim ~/.vim # or ~/vimfiles for Windows
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
vim +BundleInstall +qall
```
