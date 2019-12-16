# ivansible.lin_devel

[![Github Test Status](https://github.com/ivansible/lin-devel/workflows/Molecule%20test/badge.svg?branch=master)](https://github.com/ivansible/lin-devel/actions)
[![Travis Test Status](https://travis-ci.org/ivansible/lin-devel.svg?branch=master)](https://travis-ci.org/ivansible/lin-devel)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-ivansible.lin__devel-68a.svg?style=flat)](https://galaxy.ansible.com/ivansible/lin_devel/)

This role configures remote host for development.
It installs common development packages:

  - golang toolchain
  - archivers: gzip, unzip, unrar
  - development tools: git, vim, etc
  - network tools: dig, netcat, iperf, etc
  - build-essential packages
  - ngrok

Also this role tweaks some kernel settings for development.


## Requirements

None


## Variables

Available variables are listed below, along with default values.

    lindev_golang_version: 1.13

Golang toolchain version to install (skip install if empty).


## Tags

- `lindev_packages` - install development packages
- `lindev_ngrok` - install ngrok
- `lindev_golang` - install golang toolchain
- `lindev_utils` - utilities (gendiff)
- `lindev_sysctl` - tweak kernel settings for development
- `lindev_all` - all of the above


## Dependencies

- `ivansible.lin_base` -- for `allow_sysctl`


## Testing

    molecule test [-s default]
    ivantory-role .lin-devel vag2


## Dependencies

None


## Example Playbook

    - hosts: vagrant-boxes
      roles:
         - role: ivansible.lin_devel


## License

MIT


## Author Information

Created in 2019-2020 by [IvanSible](https://github.com/ivansible)
