# ~/.bash

# some more ls aliases
alias ll='ls -rthal'
alias la='ls -A'
alias l='ls -CF'
alias o='xdg-open'
alias k='pkill -9'
alias cl='clear'
alias q='exit'

alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'

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

counts()
{
  if [[ $# < 1 ]]
  then
    echo "usage: counts myfile.txt"
  else
    wc $1 | awk '{print "lines " $1 " words " $2 " characters " $3}'
  fi
}
