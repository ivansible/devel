# ivansible.lin_devel

[![Github Test Status](https://github.com/ivansible/lin-devel/workflows/Molecule%20test/badge.svg?branch=master)](https://github.com/ivansible/lin-devel/actions)
[![Travis Test Status](https://travis-ci.org/ivansible/lin-devel.svg?branch=master)](https://travis-ci.org/ivansible/lin-devel)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-ivansible.lin__devel-68a.svg?style=flat)](https://galaxy.ansible.com/ivansible/lin_devel/)

This role configures remote host for development.
It installs common development packages:

  - archivers: gzip, unzip, unrar
  - development tools: git, vim, etc
  - network tools: dig, netcat, iperf, etc
  - html tools: curl, wget, [pup](https://github.com/ericchiang/pup), [xpath](https://manpages.ubuntu.com/manpages/xenial/en/man1/xpath.1p.html)
  - build-essential packages
  - ngrok

Also this role tweaks some kernel settings for development.


## Requirements

None


## Variables

    lindev_upgrade_pup: false
If `true`, pup will be upgraded whenever new version is found.
If `false` (the default), pup will be installed only when needed.


## Tags

- `lindev_packages` - install development packages
- `lindev_ngrok` - install ngrok
- `lindev_golang` - install golang toolchain
- `lindev_pup` - install [pup](https://github.com/ericchiang/pup)
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
