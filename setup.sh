#! /bin/bash
#
# Copies the dot files where needed.

TARGET_VIM=$HOME/.vimrc

TARGET_GIT_CONFIG=$HOME/.gitconfig

TARGET_BASH_ALIASES=$HOME/.bash_aliases

TARGET_TERMINATOR=$HOME/.config/terminator/config

TARGET_FILES=($TARGET_VIM $TARGET_GIT_CONFIG $TARGET_BASH_ALIASES $TARGET_TERMINATOR)

SOURCE_BASE=$(pwd)

SOURCE_VIM=$SOURCE_BASE/.vimrc

SOURCE_GIT_CONFIG=$SOURCE_BASE/.gitconfig

SOURCE_BASH_ALIASES=$SOURCE_BASE/.bash_aliases

SOURCE_TERMINATOR=$SOURCE_BASE/terminator/config

SOURCE_FILES=($SOURCE_VIM $SOURCE_GIT_CONFIG $SOURCE_BASH_ALIASES $SOURCE_TERMINATOR)

declare -A FILES_PAIRS

for ((i=0;i<${#SOURCE_FILES[@]};++i)); do

	source=${SOURCE_FILES[i]}
	target=${TARGET_FILES[i]}

	if [ -f "$target" ]; then

	  echo -e "\nFile $target exists. Do you want to replace it ? (original file will be moved to $target.old) [Y/n]"
	  REP=aa

	  while [ "${REP,,}" != "y" ] && [ "${REP,,}" != "n" ] && [ "${REP,,}" != "" ]; do
		read REP
	  done
	  
	  if [ "${REP,,}" == "y" ] | [ "${REP,,}" == "" ]; then
		echo -e "\nReplacing $target with $source :"
		echo -e "\t- Moving $target to $target.old"
	  fi

	fi
done

# Copy pose target folder
#cp `rospack find pal_navigation_sm`/config/pose.yaml $TARGET
echo "Done."
