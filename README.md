![build_status_badge_ci](https://github.com/bellackn/ansible-collection-homelab/actions/workflows/ci.yml/badge.svg)

# bellackn.homelab

This is an Ansible collection that holds various roles that are handy for a homelab infrastructure setup. Currently
it just consists of good old Ansible roles. I just had to convert them into a collection because RedHat forced me, 
basically.

## How to Install

`ansible-galaxy collection install bellackn.homelab`

## Content

### Roles

#### [proxmox_lxc](roles/proxmox_lxc/README.md)

Sets up Proxmox LXCs. **This was the former main content of this repository.**

#### [hms_mqtt_publisher](roles/hms_mqtt_publisher/README.md)

Deploys [hms-mqtt-publisher](https://github.com/DennisOSRM/hms-mqtt-publisher) as a systemd service.
