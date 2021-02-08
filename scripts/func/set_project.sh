#!/bin/bash

mkdir -p /tmp/cscopedb

function set_project()
{
	local proj=${@}
	local db_name=""

	if [ -z ${proj} ]; then
		proj=$(basename ${PWD})
	fi

	for p in ${proj}
	do
		db_name="${db_name}_${p}"
	done

	echo >/tmp/cscopedb/cscope${db_name}.files
	for p in ${proj}
	do
		find ${PWD} -name "*.[ch]" >>/tmp/cscopedb/cscope${db_name}.files
	done

	cscope -b -i /tmp/cscopedb/cscope${db_name}.files -f /tmp/cscopedb/cscope${db_name}.out

	export CSCOPE_DB=/tmp/cscopedb/cscope${db_name}.out
	echo "## Project ${CSCOPE_DB} active ##"
}

