#!/bin/bash

SDK_BUILDER=dev.iopsys.eu:5050/iopsys/iopsyswrt/sdk-builder

function sdk()
{
	[ -z "${BRANCH}" ] && BRANCH="$(git branch --show-current)"

	docker run -ti --network host --rm -e "TERM=xterm-256color" -v "${PWD}:/home/dev/iopsyswrt" -v "${HOME}/.git-credential:/home/dev/.git-credential" -v "${HOME}/.ssh:/home/dev/.ssh" -v "${HOME}/git:/home/dev/git" -v "${HOME}/Airoha:/home/dev/Airoha" -v "${HOME}/broadcom:/home/dev/broadcom" -v "${HOME}/dl:/home/dev/dl" -u $(id -u):$(id -g) ${SDK_BUILDER}:${BRANCH:-devel} $@
}

