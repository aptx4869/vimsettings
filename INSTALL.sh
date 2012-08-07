#!/bin/bash

#-------------------------------------------------
#     Author: aptx4869 <ling548@gmail.com>
#     https://github.com/aptx4869
#  
#     File: INSTALL.sh
#     Create Date: 2012-08-07 10:31:38
#-------------------------------------------------

git submodule init
git submodule update
[ -f ~/.vimrc ] && mv ~/.vimrc{,.bak}
[ -f ~/.vim ] && mv ~/.vim{,.bak}
ln -s "$PWD/.vim" ~/.vim
ln -s "$PWD/.vimrc" ~/.vimrc
