# ~/.bash

# some more ls aliases
alias ll='ls -rthal'
alias la='ls -A'
alias l='ls -CF'
alias o='xdg-open'
alias k='pkill -9'
alias cl='clear'
alias q='exit'

llgrep() {
    ll | grep -i "`echo $@`"
}

lsgrep() {
    ls -l | grep -i "`echo $@`"
}

alias igrep='grep -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

function top_track()
{
  if [[ $# < 1 ]]
  then
    echo "usage: top_track PID [OPTIONAL]OUTPUTFILE"
  elif [[ $# < 2 ]]
  then
    top -p ${1} -d 1 -b | grep ${1}
  elif [[ $# < 3 ]]
  then
    top -p ${1} -d 1 -b | grep ${1} --line-buffered > ${2}
  fi
}

function top_process()
{
  if [[ $# < 1 ]]
  then
    echo "usage: top_process <process_name>"
  elif [[ $# < 2 ]]
  then
    PIDOFS=$(pidof ${1})
    PIDOFS=${PIDOFS// /,}
    top -p ${PIDOFS} -d 0.5
  fi
}

alias chars='wc -m'
alias words='wc -w'
alias lines='wc -l'

# Open file with default application (GNOME)
alias go='xdg-open'

counts()
{
  if [[ $# < 1 ]]
  then
    echo "usage: counts myfile.txt"
  else
    wc $1 | awk '{print "lines " $1 " words " $2 " characters " $3}'
  fi
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# This will probably need some update
alias clocpp='cloc --exclude-lang=HTML,CSS,Javascript,YAML,XML,Bourne Shell'

# Check if a yaml file syntax is valid
alias yamlcheck='python -c "import sys, yaml as y; y.safe_load(open(sys.argv[1]))"'

# Add an "alert" alias for long running commands. Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

install(){
  sudo apt-get install $1
}

alias qt='nohup qtcreator >/dev/null 2>&1 &'
#alias qtcreator='nohup qtcreator >/dev/null 2>&1 &'
alias qtcreator='export CURRENT_CMAKE_BUILD_DIR="$(catkin locate --workspace $(pwd) --build)";\
                 source "$(catkin locate --workspace $(pwd) --devel)/setup.bash";\
                 nohup qtcreator >/dev/null 2>&1 &'


function set-git-user()
{
  if [[ $# < 3 ]]
  then
    echo "usage: set-git-user prenom nom mail"
  else
    git config --global user.name "$1 $2"
    git config --global user.email "$3"
  fi
}

function gochrome()
{
  if [[ $# < 1 ]]
  then
    echo "usage: gochrome <url>"
  else
    nohup google-chrome --args "$1" > /dev/null 2>&1 &
  fi
}

alias xkcd='gochrome https://xkcd.com/'

function gogoogle()
{
  if [[ $# < 1 ]]
  then
    echo "usage: gogoogle <url>"
  else
    gochrome http://www.google.com/search?q=$1
  fi
}

function repeat()
{
  if [[ $# < 2 ]]
  then
     echo "usage: repeat <n> <cmd>"
  else
     #run in {1..$1}; do $2; done
    echo "About to execute '$2' $1 times."
    for ((i = 1; i <= $1; i++ )); do
      $2
    done
  fi
}

alias EIGEN_VERSION='grep "#define EIGEN_[^_]*_VERSION" /usr/include/eigen3/Eigen/src/Core/util/Macros.h'
