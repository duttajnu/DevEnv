#!/bin/bash
total_setups=2
current=1

echo "Installing hooks in bashrc (${current}/${total_setups})"
path=$(pwd)

cat >>~/.bashrc <<MUTE
if [ -f ${path}/scripts/work_init.sh ]; then
	. ${path}/scripts/work_init.sh
fi
MUTE
current=$(( current + 1 ))
echo "Installing hooks ... Done"

echo "Installing vim plugins (${current}/${total_setups})"
cp -rf .vim ~/
cat .vimrc >>~/.vimrc
current=$(( current + 1 ))
echo "Installing vim plugins .. Done"
