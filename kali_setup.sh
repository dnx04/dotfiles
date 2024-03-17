#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install build-essential gdb file patchelf elfutils

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"