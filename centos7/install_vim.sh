#!/bin/bash

# install dependency
# assume that gcc-c++, python-devel, and ruby-devel are already installed.
sudo yum install ncurses-devel lua-devel


cd ~/dotfiles/centos7
mkdir gitclones

cd gitclones

git clone https://github.com/vim/vim.git

cd vim
./configure \
--prefix=/usr \
--with-features=huge \
--enable-multibyte \
--enable-nls \
--enable-rubyinterp \
--enable-luainterp \
--enable-pythoninterp \
--enable-cscope \
--enable-gui \
--enable-fail-if-missing=yes

make

sudo make install

