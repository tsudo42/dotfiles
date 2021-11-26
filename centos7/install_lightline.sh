#!/bin/bash
cd ~/dotfiles/centos7
mkdir gitclones

cd gitclones
git clone https://github.com/itchyny/lightline.vim

mkdir -p ~/dotfiles/vimex/pack/plugins/start/lightline
cp -R lightline.vim/ ~/dotfiles/vimex/pack/plugins/start/lightline

git clone https://github.com/cocopon/iceberg.vim.git

cp -R iceberg.vim/ ~/dotfiles/vimex/
