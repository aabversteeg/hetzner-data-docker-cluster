#!/bin/bash

set -e

mkdir -p ./ssh/

if [ ! -f ./ssh/id_rsa ]; then
    echo "Creating SSH key...";
    ssh-keygen -t rsa -N "" -f ./ssh/id_rsa
fi

docker-compose run -w /app/ansible manager run_playbook.sh "$@"