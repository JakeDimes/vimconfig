#!/bin/bash

read -p "This will overwrite directory ~/.vim and file ~/.vimrc. Continue? [y/n]" dest

if [ $dest == "y" ]; then
	cp -r ./.vim $HOME/
	cp ./.vimrc $HOME/
else
	echo "Cancelling"
fi

unset dest

