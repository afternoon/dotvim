afternoon/dotvim
================

- Uses Vundle
- Is designed for MacVim (though other Vims should mostly work)
- Maps lots of stuff with &lt;leader&gt;
- Has been evolving for a while and is probably crufty
- Doesn't have great autocomplete (buffer only, nothing clever)

See top of `vimrc` for the bundle list.

Install
-------

    git clone git@github.com:afternoon/dotvim ~/.vim (or vimfiles)
    mkdir -p ~/.vim/bundle
    git clone git@github.com:gmarik/vundle ~/.vim/bundle/vundle
    ln -s ~/.vim/vimrc .vimrc
    ln -s ~/.vim/gvimrc .gvimrc
    vim +BundleInstall +qall
