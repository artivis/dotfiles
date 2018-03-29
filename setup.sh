#! /bin/bash
#
# Copies the dot files where needed.

TARGET_VIM=$HOME/.vimrc
TARGET_VIM_CONFIG=$HOME/.vim

TARGET_GIT_CONFIG=$HOME/.gitconfig
TARGET_GIT_IGNORE_GLOBAL=$HOME/.gitignore_global
TARGET_GIT_CONFIG_FOLDER=$HOME/.git-config

TARGET_BASH_ALIASES=$HOME/.bash_aliases

TARGET_BASH_ROS_ALIASES=$HOME/.bash_ros_aliases

TARGET_TERMINATOR=$HOME/.config/terminator/config

TARGET_ROSCORIZING=$HOME/.roscorizing

TARGET_FILES=( $TARGET_VIM
							 $TARGET_VIM_CONFIG
			   			 $TARGET_GIT_CONFIG
				 		 	 $TARGET_GIT_IGNORE_GLOBAL
							 $TARGET_GIT_CONFIG_FOLDER
			   	 		 $TARGET_BASH_ALIASES
			   	 		 $TARGET_BASH_ROS_ALIASES
			   	 		 $TARGET_TERMINATOR
							 $TARGET_ROSCORIZING
						 )

#TARGET_FILES=($HOME/toto)

SOURCE_BASE=$(pwd)

SOURCE_VIM=$SOURCE_BASE/.vimrc
SOURCE_VIM_CONFIG=$SOURCE_BASE/.vim

SOURCE_GIT_CONFIG=$SOURCE_BASE/.gitconfig
SOURCE_GIT_IGNORE_GLOBAL=$SOURCE_BASE/.gitignore_global
SOURCE_GIT_CONFIG_FOLDER=$SOURCE_BASE/.git-config

SOURCE_BASH_ALIASES=$SOURCE_BASE/.bash_aliases

SOURCE_BASH_ROS_ALIASES=$SOURCE_BASE/.bash_ros_aliases

SOURCE_TERMINATOR=$SOURCE_BASE/terminator/config

SOURCE_ROSCORIZING=$SOURCE_BASE/roscorizing

SOURCE_FILES=( $SOURCE_VIM
							 $SOURCE_VIM_CONFIG
							 $SOURCE_GIT_CONFIG
				 		 	 $SOURCE_GIT_IGNORE_GLOBAL
							 $SOURCE_GIT_CONFIG_FOLDER
			   	 		 $SOURCE_BASH_ALIASES
			   	 		 $SOURCE_BASH_ROS_ALIASES
			   	 		 $SOURCE_TERMINATOR
							 $SOURCE_ROSCORIZING
						 )

#SOURCE_FILES=($SOURCE_BASE/toto)

for ((i=0;i<${#SOURCE_FILES[@]};++i)); do

	source=${SOURCE_FILES[i]}
	target=${TARGET_FILES[i]}

	REP=NOTHEREARENOENTRYYET

	if [ -f "$target" ]; then

	  while [ "${REP,,}" != "r" ] && [ "${REP,,}" != "s" ] && [ "${REP,,}" != "c" ] && [ "${REP,,}" != "" ]; do

		echo -e "\nFile $target exists, what to do [r, S, c, q] ?"

		read REP

		if [ "${REP,,}" == "q" ]; then
			exit 0
		elif [ "${REP,,}" == "r" ]; then
			echo -e "\nReplacing $target with $source :"
			echo -e "\t- Moving $target to $target.old"
			mv $target $target.old
			echo -e "\t- Linking $source to $target"
			ln -s $source $target
			continue
		elif [ "${REP,,}" == "c" ]; then
			echo -e "\nSkipping $target."
			continue
		elif [ "${REP,,}" == "s" ] | [ "${REP,,}" == "" ]; then
			echo -e "\nMoving $target to $target.old:"
			echo -e "\nReplacing $target with $source :"
			echo -e "\t- Moving $target to $target.old"
			mv $target $target.old
			echo -e "\t- Linking $source to $target"
			ln -s  $source $target
			continue
		else
			echo "---------------------- Lol wrong ! ---------------------"
			echo "[r] - replace. Replace whatever is there blindly."
			echo "[s] - safe. Move old config and copy new one (Default)."
			echo "[c] - continue. Move on to the next file."
			echo "[q] - quit."
			echo "--------------------------------------------------------"
		fi

	  done

	else
		echo -e "\t- Linking $source to $target"
		ln -s $source $target
	fi

done

while [ "${REP,,}" != "y" ] && [ "${REP,,}" != "n" ] && [ "${REP,,}" != "" ]; do

	echo -e "\nSource .bash_ros_aliases [Y, n, q] ?"

	read REP

	if [ "${REP,,}" == "q" ]; then
		exit 0
	elif [ "${REP,,}" == "n" ]; then
		break
	elif [ "${REP,,}" == "y" ] | [ "${REP,,}" == "" ]; then
		echo -e "\nif [ -f ~/.bash_ros_aliases ]; then\n    . ~/.bash_ros_aliases\nfi" >> $HOME/.bashrc
		continue
	else
		echo "---------------------- Lol wrong ! ---------------------"
		echo "[y] - replace. Replace whatever is there blindly."
		echo "[n] - safe. Move old config and copy new one (Default)."
		echo "[q] - quit."
		echo "--------------------------------------------------------"
	fi

done

echo "Done."
