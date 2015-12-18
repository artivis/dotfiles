#! /bin/bash
#
# Copies the dot files where needed.

TARGET_VIM=$HOME/.vimrc

TARGET_GIT_CONFIG=$HOME/.gitconfig

TARGET_BASH_ALIASES=$HOME/.bash_aliases

TARGET_BASH_ROS_ALIASES=$HOME/.bash_ros_aliases

TARGET_TERMINATOR=$HOME/.config/terminator/config

TARGET_FILES=( $TARGET_VIM
			   $TARGET_GIT_CONFIG
			   $TARGET_BASH_ALIASES
			   $TARGET_BASH_ROS_ALIASES
			   $TARGET_TERMINATOR )

#TARGET_FILES=($HOME/toto)

SOURCE_BASE=$(pwd)

SOURCE_VIM=$SOURCE_BASE/.vimrc

SOURCE_GIT_CONFIG=$SOURCE_BASE/.gitconfig

SOURCE_BASH_ALIASES=$SOURCE_BASE/.bash_aliases

SOURCE_BASH_ROS_ALIASES=$SOURCE_BASE/.bash_ros_aliases

SOURCE_TERMINATOR=$SOURCE_BASE/terminator/config

SOURCE_FILES=( $SOURCE_VIM
			   $SOURCE_GIT_CONFIG
			   $SOURCE_BASH_ALIASES
			   $SOURCE_BASH_ROS_ALIASES
			   $SOURCE_TERMINATOR)

#SOURCE_FILES=($SOURCE_BASE/toto)

for ((i=0;i<${#SOURCE_FILES[@]};++i)); do

	source=${SOURCE_FILES[i]}
	target=${TARGET_FILES[i]}

	REP=NOTHEREARENOENTRYYET

	if [ -f "$target" ]; then

	  while [ "${REP,,}" != "r" ] && [ "${REP,,}" != "s" ] && [ "${REP,,}" != "" ]; do

		echo -e "\nFile $target exists, what to do [r, S, q] ?"

		read REP

		if [ "${REP,,}" == "q" ]; then
			exit 0
		elif [ "${REP,,}" == "r" ]; then
			echo -e "\nReplacing $target with $source :"
			echo -e "\t- Moving $target to $target.old"
			mv $target $target.old
			echo -e "\t- Copying $source to $target"
			cp $source $target
			continue
		elif [ "${REP,,}" == "s" ] | [ "${REP,,}" == "" ]; then
			echo -e "\nMoving $target to $target.old:"
			echo -e "\nReplacing $target with $source :"
			echo -e "\t- Moving $target to $target.old"
			mv $target $target.old
			echo -e "\t- Copying $source to $target"
			cp $source $target
			continue
		else
			echo "---------------------- Lol wrong ! ---------------------"
			echo "[r] - replace. Replace whatever is there blindly."
			echo "[s] - safe. Move old config and copy new one (Default)."
			echo "[q] - quit."
			echo "--------------------------------------------------------"
		fi

	  done

	else
		echo -e "\t- Copying $source to $target"
		cp $source $target
	fi

done

echo "Done."
