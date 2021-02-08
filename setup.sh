#!/bin/bash

echo "Installing hooks in bashrc"
path=$(pwd)

cat >~/.bashrc <<MUTE
if [ -f ${path}/scripts/work_init.sh ]; then
	. ${path}/scripts/work_init.sh
fi
MUTE

echo "Installing hooks ... Done"
