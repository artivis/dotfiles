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

alias catkinmake='catkin_make -j8'
alias catkinm='catkin_make -j8'

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

function gazebo()
{
  if [[ $# < 1 ]]
  then
    echo "usage: gazebo <robot_name>"
  elif [[ $# < 3 ]]
  then
    roslaunch ${1}_2dnav_gazebo ${1}_navigation.launch
  fi
}

alias tf_tree='rosrun rqt_tf_tree rqt_tf_tree'
alias rqt_reconfigure='rosrun rqt_reconfigure rqt_reconfigure'
alias rqt_reconf='rosrun rqt_reconfigure rqt_reconfigure'

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
