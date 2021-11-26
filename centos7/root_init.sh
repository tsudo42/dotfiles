#!/bin/bash

# This installer is aimed for CentOS 7.

# install sudo
yum install -y sudo

# adduser
useradd -G wheel doj

echo ""
echo ""

echo "do \"passwd doj\", and do \"su doj\"!"

echo "Once you entered doj, do \"sudo echo 0\"!"
