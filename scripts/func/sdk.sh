#!/bin/bash

function sdk()
{
	docker run -ti --rm -e "TERM=xterm-256color" -v "${PWD}:/home/dev/iopsyswrt" -v "${HOME}/.ssh:/home/dev/.ssh" -v "${HOME}/git:/home/dev/git" -u $(id -u):$(id -g) iopsys/sdk-builder $@
}

