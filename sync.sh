#!/bin/bash

read -p "Sync To (T) or From (F) ROOT vim config? [T/F/n]" ANSWER

if [ $ANSWER == "F" ]; then
	read -p "This will overwrite directory PROJECT_ROOT/.vim and file PROJECT_ROOT/.virmc. Continue? [y/n]" ANSWER
	
	if [ $ANSWER == "y" ]; then

		rm -rf ./.vim/*
		rm ./.vimrc
		
		cp -r $HOME/.vim/after ./.vim/
		cp -r $HOME/.vim/pack ./.vim/
		cp $HOME/.vimrc ./

	else
		echo "Cancelling"
	fi

elif [ $ANSWER == "T" ]; then

	read -p "This will overwrite directory ~/.vim and file ~/.vimrc. Continue? [y/n]" ANSWER
	
	if [ $ANSWER == "y" ]; then
		rm -rf $HOME/.vim/after
		rm -rf $HOME/.vim/pack
		rm $HOME/.vimrc
		
		
		cp -r ./.vim $HOME/
		cp ./.vimrc $HOME/
	else
		echo "Cancelling"
	fi

else
	echo "Exiting"
fi

unset ANSWER

