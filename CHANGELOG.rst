==============================
Bellackn Homelab Release Notes
==============================

.. contents:: Topics

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
