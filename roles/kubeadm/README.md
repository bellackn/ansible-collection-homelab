# bellackn.kubeadm

This role installs kubeadm and other necessary Kubernetes tools. It uses
Docker-Engine as the container runtime and Cilium as the network plugin.

> DISCLAIMER: This role works only for setups with a single head node.

## How to Use

Install Docker on your target hosts and then run the role against them. The
target for this role is that you're able afterwards to run `kubeadm init` and
`kubeadm join` to create a functional cluster.

## Role Variables

See [defaults/main.yml](defaults/main.yml).

## Example Playbook

This works with an inventory like that:

```ini
[k8s]
k8s-head
k8s-worker1
k8s-worker2
```

```yaml
---
- name: Install kubeadm
  hosts: k8s
  gather_facts: true
  roles:
    - bellackn.homelab.kubeadm
```

## License

MIT

## Author Information

[Nico Bellack](mailto:hello@bellack.dev)
