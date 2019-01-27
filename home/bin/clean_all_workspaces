#!/bin/bash

cd ~/workspaces
workspaces=`ls -d */`

for w in ${workspaces}
do
  echo 'Cleaning workspace '${w}
  cd ${w}
#  echo 'calling: catkin clean --all-profiles -y in '$(pwd)
  catkin clean --all-profiles -y
  cd ..
done

echo 'All cleaned-up.'
