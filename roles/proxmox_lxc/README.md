bellackn.proxmox_lxc
===============

> This role used to be called bellackn.px_lxc and was renamed as part of [#1](https://github.com/bellackn/ansible-role-proxmox-lxc/issues/1).

This role is a convenient wrapper for the Ansible Proxmox community module and can be used to create or delete LXCs on a
Proxmox instance.

How to Use
----------

The role bases upon the `proxmox_lxc_containers_present` and `proxmox_lxc_containers_absent` variables to
spawn or delete LXCs. You can put a list of LXCs into these variables; the list items use the same keys like the 
[Proxmox community module][1]. There are a lot of sane default values for most of the possible settings, but you can
override each of them, either on a global level by overriding the default `proxmox_lxc_*` variable, or for a specific
container by passing the variable into `proxmox_lxc_containers_present` - just check the example playbook (the `cpus` 
part) and you'll get the idea.

Requirements
------------

You need to have the following installed on your controlhost:
* Ansible Role `geerlingguy.pip`
  * Dependency to ensure that `pip` is present to install the required `proxmoxer` package
* Ansible Collection `community.general`
  * Contains the `community.general.proxmox` module, the centerpiece of this role

Role Variables
--------------

### Mandatory

    proxmox_lxc_api_host:

The hostname of your Proxmox instance.

    proxmox_lxc_api_user:
    proxmox_lxc_api_password:

The credentials for the API user on the Proxmox instance. If you use PAM to authenticate, make sure to append `@pam` to
the username. You should define these variables in your local repository and encrypt it using Ansible Vault.

    - hostname:

Hostname of the LXC that will be created/deleted. Must be passed to `proxmox_lxc_containers_present`/
`proxmox_lxc_containers_absent`.

    proxmox_lxc_ostemplate:

Container template to be used.

    proxmox_lxc_password: ""  # Minimum length is 5

Initial root password for the container. Either set it globally with this variable or set it for each container
individually, like in the example playbook.

### Optional

    proxmox_lxc_containers_present: []
    proxmox_lxc_containers_absent: []

Takes a list of LXCs that you either want to **create** or to **delete**. See the [Proxmox community module][1] for all 
possible variables and check the example playbook. For the absent container list, passing the hostname is enough.

(Although these are optional, not defining any of them makes the role pretty much pointless.)

    proxmox_lxc_node: "{{ proxmox_lxc_api_host }}"

The name of the Proxmox node. Defaults to `proxmox_lxc_api_host`. You might want to change this if you have multiple
nodes in your cluster.

    proxmox_lxc_api_node: "{{ proxmox_lxc_api_host }}"

The FQDN for the Proxmox node that you want to target. This is used for delegating the "Ping outside" task and therefore
must be resolvable by Ansible. It's handy in situations where your Proxmode node isn't resolvable with the same name
that it has within the Proxmox cluster (see [#4](https://github.com/bellackn/ansible-role-proxmox-lxc/issues/4)).

    proxmox_lxc_cores: 1
    proxmox_lxc_cpus: 1
    proxmox_lxc_cpuunits: 1000
    proxmox_lxc_description: Created with Ansible
    proxmox_lxc_disk: 3
    proxmox_lxc_features: []
    proxmox_lxc_force: no
    proxmox_lxc_hookscript: ""
    proxmox_lxc_memory: 512
    proxmox_lxc_mounts: {}
    proxmox_lxc_nameserver: ""
    proxmox_lxc_onboot: no
    proxmox_lxc_pool: ""
    proxmox_lxc_pubkey: ""
    proxmox_lxc_searchdomain: ""
    proxmox_lxc_storage: local
    proxmox_lxc_swap: 0
    proxmox_lxc_timeout: 30
    proxmox_lxc_unprivileged: no
    proxmox_lxc_validate_certs: no

Various global default settings. Check the [Proxmox community module][1] for details.

    proxmox_lxc_creation_timeout: 10

Seconds to wait for successful creation of an LXC.

    proxmox_lxc_network_timeout: 60

Seconds to wait for the SSH port of the LXC to become available. Only effective if a network interface was defined.

    proxmox_lxc_ping_server: 8.8.8.8

IP address of the server to ping in order to check network functionality. Only effective if a network interface was
defined.

    proxmox_lxc_starting_timeout: 5

Seconds to wait for the LXC to be started.

    - vmid:

You can specify the VMID for the container that you want to create. If you don't set this, the next available ID will
be automatically picked. If the specified ID is already taken, the play will fail.

Example Playbook
----------------

This playbook will create two Ubuntu LXCs and delete them afterwards.

    ---
    - name: Set up LXCs
      hosts: proxmox
      gather_facts: no
      vars:

        proxmox_lxc_api_host: proxmox
        proxmox_lxc_api_user: root@pam
        proxmox_lxc_api_password: s3cr3t!
        proxmox_lxc_storage: local-lvm
        proxmox_lxc_cpus: 2  # Specify the value for all LXCs created with this role

        proxmox_lxc_containers_present:
          - hostname: test1
            netif: |
              {"net0":"name=eth0,gw=192.168.0.1,ip=192.168.0.201/32,ip6=dhcp,bridge=vmbr0"}
            ostemplate: local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz
            password: foooo
            pubkey: "{{ lookup('file', '/path/to/your/public-key') }}"
          - hostname: test2
            cpus: 2  # Use a value specifically for this LXC
            ostemplate: local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz
            password: baaar
    
        proxmox_lxc_containers_absent:
          - hostname: test1
          - hostname: test2
    
      roles:
        - bellackn.homelab.proxmox_lxc

Known Limitations
-----------------

* It's currently not possible to authenticate with Proxmox using API tokens, you have to use user/password.
* Deleting containers must happen by specifying its hostname, deleting by VMID is not yet possible.

License
-------

MIT

Author Information
------------------

[Nico Bellack](mailto:blcknc@pm.me)

Acknowledgements
----------------

This role was heavily inspired by the [ovv.lxc](https://github.com/ovv/ansible-role-proxmox-lxc) role. Thank you!

[1]: https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_module.html
