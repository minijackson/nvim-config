Installation
============

```sh
git clone <repo url> ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
# For the GdbMgr plugin
cd ~/.vim/bundle/gdbmgr/gdbmgr/src/
make
```

Then add to your .(bash/zsh/ksh)rc :
```sh
export LD_LIBRARY_PATH="$HOME/.vim/gdbmgr/src:default"
```