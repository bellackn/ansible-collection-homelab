# bellackn.kubeadm

This role installs kubeadm and other necessary Kubernetes tools. It uses
Docker-Engine as the container runtime.

## How to Use

[...]

## Role Variables

See [defaults/main.yml](defaults/main.yml).

## Example Playbook

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
