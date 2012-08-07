#!/bin/bash

#-------------------------------------------------
#     Author: aptx4869 <ling548@gmail.com>
#     https://github.com/aptx4869
#  
#     File: INSTALL.sh
#     Create Date: 2012-08-07 10:31:38
#-------------------------------------------------

if [ -d ~/.vimsettings ];
then
	echo "\033[0;33mFound ~/.vimsettings.\033[0m \033[0;32]Checking status\033[0m";
	cd ~/.vimsettings;
	echo `LANG=en git status` | grep 'nothing to commit' > /dev/null 2>&1;
	if [ "$?" -eq "1" ]; then
		echo "\033[0;33mNot clean\033[0m \033[0;32]Backing up to ~/.vimsettings.back_up\033[0m";
		mv ~/.vimsettings ~/.vimsettings.back_up;

		echo "\033[0;34mCloning vim settings...\033[0m"
		hash git >/dev/null && /usr/bin/env git clone git://github.com/aptx4869/vimsettings.git ~/.vimsettings || {
		echo "git not installed"
		exit
		}
	else
		echo "\033[0;33mYou already have vimsettings installed.\033[0m You'll need to remove ~/.vimsettings if you want to reinstall"
		exit
	fi
fi	

cd ~/.vimsettings

echo "\033[0;34mCloning submodules...\033[0m"
git submodule init
git submodule update

echo "\033[0;34mLooking for an existing config...\033[0m"

if [ -d ~/.vim ];
then
	echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32]Backing up to ~/.vim.back_up\033[0m";
	mv ~/.vim ~/.vim.back_up;
fi

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ];
then
	echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32]Backing up to ~/.vimrc.back_up\033[0m";
	mv ~/.vimrc ~/.vimrc.back_up;
fi

ln -s "$PWD/.vim" ~/.vim
ln -s "$PWD/.vimrc" ~/.vimrc
