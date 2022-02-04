#!/bin/bash

read -p "Sync To (T) or From (F) ROOT vim config? [T/F/n]" ANSWER

if [ $ANSWER == "F" ]; then
	read -p "This will overwrite directory PROJECT_ROOT/.vim and file PROJECT_ROOT/.virmc. Continue? [y/n]" ANSWER
	
	if [ $ANSWER == "y" ]; then

		cp -r $HOME/.vim ./
		cp $HOME/.vimrc ./

	else
		echo "Cancelling"
	fi

elif [ $ANSWER == "T" ]; then

	read -p "This will overwrite directory ~/.vim and file ~/.vimrc. Continue? [y/n]" ANSWER
	
	if [ $ANSWER == "y" ]; then
		cp -r ./.vim $HOME/
		cp ./.vimrc $HOME/
	else
		echo "Cancelling"
	fi

else
	echo "Exiting"
fi

unset ANSWER

