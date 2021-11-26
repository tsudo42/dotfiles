# Aim
This directory is for setting-up CentOS7

# Installation
## Docker
```shell
docker run -it -d --name c7 centos:centos7
docker exec -it <container id> bash
```

# First to do

Do `vi r2doj.sh` and copy-paste the file.

Then, do `chmod +x r2doj.sh && ./r2doj.sh`.

Finally, do `passwd doj`, `su doj`, and `sudo echo 0`.
