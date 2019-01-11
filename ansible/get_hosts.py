#!/usr/bin/env python

import json
import random
import subprocess
import collections


def main():
    print(
        json.dumps(
            inventory(),
            sort_keys=True,
            indent=2
        )
    )


def inventory():
    ip_list = subprocess.check_output([
        'hcloud', 'server', 'list', '-o', 'noheader', '-o', 'columns=ipv4'
    ]).decode('utf8').strip().split()

    hostvars = collections.defaultdict(dict)

    for host_i, ip in enumerate(ip_list):
        hostvars[ip].update(
            ip=ip,
            hostname='node%02d' % (host_i + 1)
        )

    swarm_managers = set(
        random.choices(ip_list, k=3)
    )

    swarm_workers = set(ip_list) - swarm_managers

    return {
        'all': {
            'hosts': ip_list,
            'vars': {
                'ansible_python_interpreter': '/usr/bin/python3'
            },
        },
        'docker_swarm_manager': {
            'hosts': list(swarm_managers)
        },
        'docker_swarm_worker': {
            'hosts': list(swarm_workers)
        },
        '_meta': {
            'hostvars': hostvars
        }

    }


if __name__ == '__main__':
    main()
