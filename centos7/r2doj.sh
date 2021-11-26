#!/bin/bash

# This installer is aimed for CentOS 7.

# install sudo
yum install -y sudo

# adduser
useradd -G wheel doj

echo "\n\ndo \"passwd doj\", and do \"su doj\"!"

echo "\n\nOnce you entered doj, do \"sudo echo 0\"!"
