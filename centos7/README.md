# Aim
This directory is for setting-up CentOS7

# Installation
## Docker
```shell
docker run -it -d centos:centos7
docker exec -it <container id> bash
```

## Clone dotfiles

Run the contents of `root_init.sh`.

```shell
cd ~
vi root_init.sh
chmod +x root_init.sh && ./root_init.sh
```

Then set the password and change the user.

```shell
passwd doj
su doj
cd ~
vi doj_init.sh
chmod +x doj_init.sh && ./doj_init.sh
```

## Run setup scripts

```shell
cd ~/dotfiles/centos7
./link_dotfiles.sh
./install_tools.sh
source ~/.bashrc
./install_vim.sh
./install_lightline.sh
```
