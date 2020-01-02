# ivansible.dev_terraform

Install HashiCorp Terraform and few 3rd-party plugins:
- vultr provider plugin
- ansible provisioner plugin
If the host belongs to `permitted` group, this role will also checkout
user terraform plans.


## Requirements

None


## Variables

    terraform_plans_repo: ""
    terraform_plans_dir: ~/devel/vagrant
If current host belongs to the `permitted` group and the URL of Git repository
with user _terraform plans_ is defined and not empty, the repository will be
checked out in the given local directory.

    terraform_version: latest
Version of terraform binary to install.
    terraform_allow_reinstall: false
Allows to override already installed binary.

    terraform_provisioner_ansible_repo_owner: radekg
    terraform_provisioner_ansible_version: v...
    terraform_provider_vultr_repo_owner: squat
    terraform_provider_vultr_version: v...
Repositories and versions of terraform plugins to install.


## Tags

- `ip4only` -- Mark this role as inappropriate for IPv6-only hosts
               since it requires access to github
- `dev_terraform` -- The whole role
- `dev_terraform_install` -- Install terraform binary
- `dev_terraform_plugins` -- Install 3rd-party terraform plugins
- `dev_terraform_user` --All user-related terraform actions
- `dev_terraform_aliases` -- Configure terraform aliases for user
- `dev_terraform_completion` -- Configure terraform bash completion for user
- `dev_terraform_plans` -- Checkout user terraform plans


## Dependencies

This role implicitly depends on the role `ivansible.dev_user`.

Note: Currently this dependency is **not** recorded in `meta/main.yml`.

## Example Playbook

    - hosts: devbox
      roles:
        - role: ivansible.dev_terraform


## License

MIT

## Author Information

Created in 2019-2020 by [IvanSible](https://github.com/ivansible)
