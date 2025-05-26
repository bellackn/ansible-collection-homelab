![build_status_badge_ci](https://github.com/bellackn/ansible-collection-homelab/actions/workflows/ci.yml/badge.svg)

# bellackn.homelab

This is an Ansible collection that holds various roles that are handy for my homelab infrastructure setup.

## How to Install

`ansible-galaxy collection install bellackn.homelab`

## Content

### Roles

#### [hms_mqtt_publisher](roles/hms_mqtt_publisher/README.md)

Deploys [hms-mqtt-publisher](https://github.com/DennisOSRM/hms-mqtt-publisher) as a systemd service.

#### [kubeadm](roles/kubeadm/README.md)

Sets up Kubernetes clusters with kubeadm.

#### [proxmox_lxc](roles/proxmox_lxc/README.md)

Sets up Proxmox LXCs.

## Release

1. Create a new fragment in [changelogs/fragments](changelogs/fragments)
2. Create a release summary in the same directory
3. Bump the version in [galaxy.yml](galaxy.yml)
4. Run `antsibull-changelog release`
5. Create and push the according git tag
6. Create a release on GitHub (use the previous ones as a template)
