#!/bin/bash

SCRIPT_PATH=~/git/scripts/func/

for f in `ls -1 ${SCRIPT_PATH}`
do
	. ${SCRIPT_PATH}/${f}
done

alias checkpatch='~/git/scripts/checkpatch.pl --max-line-length=120 --ignore CONST_STRUCT,SPDX_LICENSE_TAG,NEW_TYPEDEFS --no-tree -f'
