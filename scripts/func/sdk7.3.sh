#!/bin/bash

function sdk7.3()
{
	docker run -ti --rm -e "TERM=xterm-256color" -v "${PWD}:/home/dev/iopsyswrt" -v "${HOME}/.git-credential:/home/dev/.git-credential" -v "${HOME}/.ssh:/home/dev/.ssh" -v "${HOME}/git:/home/dev/git" -v "${HOME}/broadcom:/home/dev/broadcom" -v "${HOME}/dl:/home/dev/dl" -u $(id -u):$(id -g) iopsys/sdk-builder:release-7.3 $@
}

