==============================
Bellackn Homelab Release Notes
==============================

.. contents:: Topics

v6.1.0
======

Release Summary
---------------

A new role was added to set up K8s clusters with kubeadm. Also a minor fix in
the `proxmox_lxc` role.

Major Changes
-------------

- Added a new `kubeadm` role as part of the collection

Minor Changes
-------------

- The `proxmox_lxc` role does now also check for another string when deleting LXCs

v6.0.0
======

Release Summary
---------------

The `storage` parameter had to be removed from the `proxmox_lxc` role because
it has become mutually exclusive with `disk`.

Breaking Changes / Porting Guide
--------------------------------

- The `proxmox_lxc_storage` parameter was removed from the `proxmox_lxc` role.

  Old way:
  ```
  proxmox_lxc_disk: 3
  proxmox_lxc_storage: local
  ```

  New way:
  ```
  proxmox_lxc_disk: local:3
  ```

v5.2.1
======

Release Summary
---------------

Fixed a bug in the `proxmox_lxc` role.

Bugfixes
--------

- The "Ping outside"-task in the `proxmox_lxc` role now works with VMIDs > 2 digits (https://github.com/bellackn/ansible-collection-homelab/issues/17)

v5.2.0
======

Release Summary
---------------

Remove the `proxmox_default_behavior` directive since it was removed from the upstream community collection.
Also add the `proxmox_lxc_no_log` variable to control whether logs will be printed while creating/deleting LXCs.

Minor Changes
-------------

- Make `no_log` configurable
- Remove `proxmox_default_behavior` since this was removed from the community module

v5.1.0
======

Release Summary
---------------

Add hms_mqtt_publisher role

v5.0.1
======

Release Summary
---------------

This is a dummy release to check if releasing via GH Actions works.

v5.0.0
======

Release Summary
---------------

This is the first release I've made with antsibull-changelog. Details below.

Breaking Changes / Porting Guide
--------------------------------

- This PR converts the former `bellackn.proxmox_lxc` role into a part of the `bellackn.homelab` collection. Check the updated READMEs for details.
