#!/bin/bash

SCRIPT_PATH=${WORKENV}/scripts/
for f in `ls -1 ${SCRIPT_PATH}/func/`
do
	. ${SCRIPT_PATH}/func/${f}
done

alias checkpatch="${SCRIPT_PATH}/checkpatch.pl --max-line-length=120 --ignore CONST_STRUCT,SPDX_LICENSE_TAG,NEW_TYPEDEFS --no-tree -f"
