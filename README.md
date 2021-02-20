bellackn.px_lxc
===============

This role is a convenient wrapper for the Ansible Proxmox community module and can be used to create or delete LXCs on a
Proxmox instance.

Requirements
------------

* You need to have the Ansible collection `community.general` installed.

Role Variables
--------------

    px_lxc_containers_present: []

Takes a list of LXCs that you want to **create**. See the [Proxmox community module](px_community_module) for all possible 
variables and check the example playbook.

    px_lxc_containers_absent: []

Takes a list of LXCs that you want to **delete**. Passing the hostname is enough - check the example playbook.

    px_lxc_api_user:
    px_lxc_api_password:

The credentials for the API user on the Proxmox instance. If you use PAM to authenticate, make sure to append `@pam` to
the username. You should define these variables in your local repository and encrypt it using Ansible Vault.

    px_lxc_proxmox_host: proxmox

The hostname of your Proxmox instance.

    px_lxc_proxmox_node: proxmox

The name of the Proxmox node. If you just have one Proxmox host, this should be the same like `px_lxc_proxmox_host`.

    px_lxc_cores: 1
    px_lxc_cpus: 1
    px_lxc_cpuunits: 1000
    px_lxc_memory: 512
    px_lxc_onboot: yes
    px_lxc_storage: local-lvm
    px_lxc_swap: 0

Various global default values for certain hardware settings. Check the [Proxmox community module](px_community_module).

    px_lxc_creation_timeout: 10

Seconds to wait for successful creation of an LXC.

    px_lxc_network_timeout: 60

Seconds to wait for the SSH port of the LXC to become available.

    px_lxc_ping_server: 8.8.8.8

IP address of the server to ping in order to check network functionality.

    px_lxc_starting_timeout: 5

Seconds to wait for the LXC to be started.

Example Playbook
----------------

This playbook will create an Ubuntu LXC and delete if afterwards.

    ---
    - name: Set up LXCs
      hosts: proxmox
      gather_facts: no
      vars:

        px_lxc_api_user: root@pam
        px_lxc_api_password: s3cr3t!
        px_lxc_proxmox_host: proxmox
        px_lxc_proxmox_node: proxmox

        px_lxc_containers_present:
          - hostname: test
            password: password
            ostemplate: local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz
            netif: |
              {"net0":"name=eth0,gw=192.168.0.1,ip=192.168.0.201/32,ip6=dhcp,bridge=vmbr0"}
            description: Created with Ansible
    
        px_lxc_containers_absent:
          - hostname: test
    
      roles:
        - px_lxc

License
-------

MIT

Author Information
------------------

[Nico Bellack](mailto:bellack.n@gmail.com)

Acknowledgements
----------------

This role was heavily inspired by the [ovv.lxc](https://github.com/ovv/ansible-role-proxmox-lxc) role. Thank you!

[px_community_module]: https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_module.html
