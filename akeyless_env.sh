#!/bin/bash

AKEYLESS_PREFIX=akeyless://
LATEST_PROFILE=$(ls -1t ~/.akeyless/profiles/ 2>/dev/null | head -1)

if [ ! -z ${LATEST_PROFILE} ]; then
    LATEST_PROFILE=${LATEST_PROFILE%".toml"}
    for var in $(compgen -e)
    do
        if [[ "${!var}" = "${AKEYLESS_PREFIX}"* ]]; then
            SECRET_PATH=${!var#"$AKEYLESS_PREFIX"}
	    NEW_VAL=$(akeyless get-secret-value --name "${SECRET_PATH}" --profile ${LATEST_PROFILE} 2>/dev/null)
	    if [ ! -z "${NEW_VAL}" ]; then
                export $var="${NEW_VAL}"
            fi
        fi
    done
fi
