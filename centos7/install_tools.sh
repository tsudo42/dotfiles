#!/bin/bash

# install Developer Toolset by Software Collections
sudo yum install -y scl-utils centos-release-scl
sudo yum install -y devtoolset-8

# read .bashrc again for enabling devtoolset-8
source .bashrc

