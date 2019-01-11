# Docker swarm cluster manager
Use this project to easily and quickly set up a Docker Swarm cluster on the Hetzner cloud. Taking the cluster down can be done just as easy. This approach provides a good basis for applications that need computing power only temporary.

## Prerequisites:
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

## Todo:
 - Extend this project with other software, such as (py)Spark
