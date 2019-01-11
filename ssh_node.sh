#!/bin/bash

set -e

docker-compose run manager -c "server_i=$(($1-1)); servers=\"\$(hcloud server list -o noheader -o columns=ipv4)\"; arr=(\$servers); ssh -o StrictHostKeyChecking=no \"\${arr[\$server_i]}\""