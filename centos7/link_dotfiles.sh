#!/bin/bash
rm ~/.bashrc
cp my.bashrc ../
cp my.vimrc ../
ln -s ~/dotfiles/my.bashrc ~/.bashrc
ln -s ~/dotfiles/my.vimrc ~/.vimrc
