bellackn.hass_control
===============

Use this role to easily set and retrieve configurations for Home Assistant. 

How to Use
----------

The role checks for configuration files on your local machine, uploads them to Home Assistant and restarts it when 
changes occurred. It can also just download the current configuration from your instance and update your local codebase
if you have made some changes manually in the Home Assistant UI.

> 💡 It works with the Terminal & SSH plugin since the role will install Python3 in the container.

It's pretty lightweight and doesn't depend on any specific role or library.

Role Variables
--------------

    hass_control_home_assistant_base_url: http://homeassistant:8123

The URL on which your Home Assistant instance is listening.

    hass_control_home_assistant_auth_token: ""

An API token for a profile that has admin access. Needed to restart Home Assistant. See [here][1] on how to obtain one.

    hass_control_config_files: []

A list of config file names that you maintain. Check the example playbook.

    hass_control_config_templates: []

A list of templates in your local repository that will be rendered and copied to Home Assistant. Check the example 
playbook.

    hass_control_mode: get

This controls whether you download the current configuration files from your Home Assistant instance, or if you want to
upload those currently living in your local repository. Can be set to either "get" or "set".

    hass_control_config_local_root_files: files/home_assistant

The default directory where the role will look for your configuration files.

    hass_control_config_local_root_templates: templates/home_assistant

The default directory where the role will look for your configuration templates.

    hass_control_config_remote_root: /config

The root configuration directory on your Home Assistant machine.

Example Playbook
----------------

This will download a number of configuration files. If you run it with `-e hass_control_mode=set`, it will upload these
files and the rendered templates.

```yaml
---
- name: Set or get various Home Assistant configurations
  hosts: home_assistant
  gather_facts: no
  vars:
    hass_control_config_files:
      - automations
      - configuration  # The main config file.
      - frontend
      - lights
      - notify
      - scenes
      - scripts
      - sensors
    hass_control_config_templates:
      - cameras
      - secrets
      - shell_commands
    hass_control_home_assistant_auth_token: "{{ vault_hass_control_home_assistant_auth_token }}"

  collections:
    - bellackn.homelab
  roles:
    - bellackn.hass_control
```

License
-------

MIT

Author Information
------------------

[Nico Bellack](mailto:bellack.n@gmail.com)


[1]: https://developers.home-assistant.io/docs/api/rest/
