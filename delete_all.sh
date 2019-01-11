#!/bin/bash

set -e

docker-compose run manager -c "echo \"\$(hcloud server list -o columns=id -o noheader)\" | xargs -n1 hcloud server delete"