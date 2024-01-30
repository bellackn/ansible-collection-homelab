![build_status_badge_ci](https://github.com/bellackn/ansible-collection-homelab/actions/workflows/ci.yml/badge.svg)

# bellackn.homelab

This is an Ansible collection that holds various roles that are handy for a homelab infrastructure setup. Currently
it just consists of good old Ansible roles. I just had to convert them into a collection because RedHat forced me, 
basically.

## Content

### [bellackn.homelab.proxmox_lxc](roles/proxmox_lxc/README.md)

A role to set up Proxmox LXCs. **This was the former main content of this repository.**

Use it like so:
```yaml
---
# [...]
roles:
  - bellackn.homelab.proxmox_lxc
```
