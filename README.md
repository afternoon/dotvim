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
# get the repo
git clone https://github.com/afternoon/dotvim ~/.vim # or ~/vimfiles for Windows

# get Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/Vundle.vim

# symlink the key config files to your home dir
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# run Vim and install the plugins
vim +BundleInstall +qall

# install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py
```
