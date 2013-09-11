#!/bin/bash

#-------------------------------------------------
#     Author: aptx4869 <ling548@gmail.com>
#     https://github.com/aptx4869
#
#     File: INSTALL.sh
#     Create Date: 2012-08-07 10:31:38
#     Fork from :
#         https://github.com/carlhuda/janus/blob/master/bootstrap.sh
#     and https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh
#-------------------------------------------------

date=$(date +%Y%m%d-%H%M%S)
if [ -d ~/.vimsettings ];
then
	echo "\033[0;33mFound ~/.vimsettings.\033[0m \033[0;32]Checking status\033[0m";
	cd ~/.vimsettings;
	echo `LANG=en git status` | grep 'nothing to commit' > /dev/null 2>&1;
	if [ "$?" -eq "1" ]; then

		echo "\033[0;33mNot clean\033[0m \033[0;32]Backing up to ~/.vimsettings.bak.$date\033[0m";
		mv ~/.vimsettings "~/.vimsettings.bak.$date";

		echo "\033[0;34mCloning vim settings...\033[0m"
		hash git >/dev/null && /usr/bin/env git clone --depth 1 --recursive git://github.com/aptx4869/vimsettings.git ~/.vimsettings || {
		echo "git not installed"
		exit
		}
	else
		echo "\033[0;33mYou already have vimsettings installed.\033[0m You'll need to remove ~/.vimsettings if you want to reinstall"
		exit
	fi
else
	echo "\033[0;34mCloning vim settings...\033[0m"
	hash git >/dev/null && /usr/bin/env git clone --depth 1 --recursive git://github.com/aptx4869/vimsettings.git ~/.vimsettings || {
	echo "git not installed"
	exit
	}
fi

echo "\033[0;34mLooking for existing configs...\033[0m"

for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
	if [ -e $i ] || [ -h $i ]; then
		echo "\033[0;33mFound ${i}\033[0m \033[0;32]Backing up to ${i}.bak.$date\033[0m";
		mv "${i}" "${i}.bak.$date"
	fi
done

echo "\033[0;34mLink vim configuration files...\033[0m"
VIMSETS="$HOME/.vimsettings"
for i in .vim .vimrc .gvimrc; do
	echo "\033[0;33mLinking ${i}\033[0m \033[0;32] from ${HOME}/${i}\033[0m";
	ln -s "${VIMSETS}/${i}" "$HOME/${i}"
done
echo "\033[0;34mInstalling plugins with Vundle...\033[0m"
vim +BundleInstall +qall
