#!/bin/bash

# http://superuser.com/questions/803145/vim-airline-plugin-bad-characters
# https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation

mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf

fc-cache -vf $HOME/.fonts

mkdir -p $HOME/.config/fontconfig/conf.d
cd $HOME/.config/fontconfig/conf.d
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

