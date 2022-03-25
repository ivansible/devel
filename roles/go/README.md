# ivansible.lin_go

[![Github Test Status](https://github.com/ivansible/lin-go/workflows/test/badge.svg?branch=master)](https://github.com/ivansible/lin-go/actions)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-ivansible.lin__go-68a.svg?style=flat)](https://galaxy.ansible.com/ivansible/lin_go/)

This role installs Go-lang toolchain on linux.


## Requirements

None


## Variables

    lin_go_version: 1.13

Golang version to install (skip install if empty).


## Tags

- `lin_go_all` -- all tasks


## Dependencies

None


## Example Playbook

    - hosts: devhost
      roles:
         - ivansible.lin_go


## License

MIT


## Author Information

Created in 2020-2021 by [IvanSible](https://github.com/ivansible)
