#!/bin/bash

cd ~/dotfiles/centos7
mkdir gitclones

cd gitclones

# install Developer Toolset by Software Collections
sudo yum install -y scl-utils centos-release-scl
sudo yum install -y devtoolset-8

# read .bashrc again for enabling devtoolset-8
source .bashrc

