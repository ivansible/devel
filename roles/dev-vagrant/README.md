# Role ivansible.dev-vagrant

Install vagrant and plugins.
See instructions here: https://www.vagrantup.com/docs/installation/


## Requirements

None


## Variables

Available variables are listed below, along with default values.

    vagrant_package_url: latest

This can be one of:
 `ppa` (not recommended),
 `latest` (see here: https://www.vagrantup.com/downloads.html),
 url of vagrant `.deb` package.

    vagrant_plugin_list: []

If the target host belongs to the `workspace` group, a number of vagrant
plugins will be installed locally for target user.

    vagrant_allow_reinstall: no

Allows to refresh already downloaded redistributables.


## Tags

- `dev_vagrant`
- `dev_vagplugins`


## Dependencies

None


## Example Playbook

    - hosts: vag2
      roles:
        - role: ivansible.dev-vagrant


## License

MIT


## Author Information

Created in 2018 by [IvanSible](https://github.com/ivansible)
