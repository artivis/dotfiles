# ~/.bash

function rosv() {
  echo $ROS_DISTRO
}

# some more ls aliases
alias ll='ls -rthal'
alias la='ls -A'
alias l='ls -CF'
alias o='xdg-open'
alias k='pkill -9'
alias cl='clear'
alias q='exit'

alias gn='rosnode list | grep'
alias gt='rostopic list | grep'
alias gs='rosservice list | grep'
alias gp='rosparam list | grep'

alias hz='rostopic hz'

alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'

function rviz(){
  if [[ $# < 1 ]]
  then
    rosrun rviz rviz
  else
    rosrun rviz rviz -d `rospack find ${1}_2dnav`/config/rviz/navigation.rviz
  fi
}

llgrep() {
    ll | grep -i "`echo $@`"
}

lsgrep() {
    ls -l | grep -i "`echo $@`"
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
