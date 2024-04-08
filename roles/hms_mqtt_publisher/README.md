bellackn.hms-mqtt-publisher
===========================

This role deploys a compiled binary of the [hms-mqtt-publisher][1] to a host. It
conveniently sets it up as a systemd daemon.

How to Use
----------

1. Compile the binary for the wanted architecture using `cargo build`.
2. Set `hms_mqtt_publisher_bin_path` to where you've put the compiled binary.
3. Set the config variables for Home Assistant and/or simple MQTT publishing.
4. Execute the role.

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml).

Example Playbook
----------------

```yaml
---
- name: Deploy MQTT publisher to Raspberry Pi
  hosts: pi
  gather_facts: true
  become: true
  vars:
    hms_mqtt_publisher_bin_path: /tmp/hms-mqtt-publish
    hms_mqtt_publisher_inverter_host: 192.168.1.2
    hms_mqtt_publisher_homeassistant:
        host: homeassistant.local
        username: "{{ vault_hms_mqtt_publisher_homeassistant_username }}"
        password: "{{ vault_hms_mqtt_publisher_homeassistant_password }}"
    hms_mqtt_publisher_simple:
        host: mqtt.local
  collections:
    - bellackn.homelab
  roles:
    - hms_mqtt_publisher
```

License
-------

MIT

Author Information
------------------

[Nico Bellack](mailto:hello@bellack.dev)


[1]: https://github.com/DennisOSRM/hms-mqtt-publisher
