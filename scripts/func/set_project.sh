#!/bin/bash

mkdir -p /tmp/cscopedb_${USER}

function set_project()
{
	local proj="${@}"
	local db_name=""
	local DBFILE nopath path

	if [ -z "${proj}" ]; then
		proj=$(basename ${PWD})
		path=${PWD}
	fi

	for p in ${proj}
	do
		db_name="${db_name}_${p}"
	done

	DBFILE="/tmp/cscopedb_${USER}/cscope${db_name}.files"
	DBOUT="/tmp/cscopedb_${USER}/cscope${db_name}.out"
	echo >${DBFILE}

	for p in ${proj}
	do
		if [ -z "${path}" ]; then
			path="${PWD}/${p}"
		fi

		find ${path} -name "*.[ch]" >>${DBFILE}
		find ${path} -name "*.py" >>${DBFILE}
		find ${path} -name "*.js" >>${DBFILE}
		find ${path} -name "*.[ch]pp" >>${DBFILE}
	done

	cscope -b -i ${DBFILE} -f ${DBOUT}

	export CSCOPE_DB=${DBOUT}
	echo "## Project ${CSCOPE_DB}, files ${DBFILE} active ##"
}

