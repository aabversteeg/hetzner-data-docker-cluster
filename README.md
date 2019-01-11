# Docker swarm cluster manager
Use this project to easily set up a Docker Swarm cluster on the Hetzner cloud.

##Prerequisites:
 - Verified Hetzner account
 - One or more virtual machines up and running. Must be placed in a single project.

## Setup
Create the .env file and add your Hetzner API token:
HCLOUD_TOKEN=...

## Commands
`run_ansible.sh`
Runs Ansible to deploy the Docker Swarm cluster to all the servers in your Hetzner project (corresponding to the API token).

`delete_all.sh`
Deletes all servers in your Hetzner project.

`ssh_node.sh [int]`
SSH to node by index.

`container_exec.sh`
Start a shell in the manager's container.
