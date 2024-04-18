#!/bin/sh

yay -Syyu
yay -S zsh gdb sagemath

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"