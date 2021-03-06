# ivansible.dev_ivantory

[![Github Test Status](https://github.com/ivansible/dev-ivantory/workflows/test/badge.svg?branch=master)](https://github.com/ivansible/dev-ivantory/actions)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-ivansible.dev__ivantory-68a.svg?style=flat)](https://galaxy.ansible.com/ivansible/dev_ivantory/)

This role will:

- install github (and gitlab) access keys (via `ivansible.dev_user` role);
- setup bash and git aliases for development (via `ivansible.dev_user` role);
- install ansible locally for user (via `ivansible.dev_ansible` role);
- install github client [hub](https://github.com/github/hub) for making new roles;
- check out `ivantory` inventory and playbooks from github;
- configure cipher and password for
  [transcrypt](https://github.com/elasticdog/transcrypt);
- decrypt the repository;
- harden permissions of secret files;
- login to ansible galaxy using github token;
- import required roles;

After that you can control `ivansible` inventory and run playbooks.


## Requirements

You should have SSH agent running on the controller machine to provide
RSA key with write access to the ivansible github repository.
This key will be forwarded to the installation.


## Variables

Available variables are listed below, along with default values.

    real_ssh_port: <optional>
This optional setting lets the user override an auto-detected ssh port value,
which may be incorrect if ansible is run by the hashicorop packer or through
a reverse ssh or port forwarder. An incorrect value is generally harmless
though, as the role uses it only to fill in a comment.

    divan_repo: git@github.com:username/reponame.git

URL of github repository with ivansible.

    divan_branch: main

Repository branch to checkout.

    divan_dir: ~/devel/ivantory

Directory for checkout.

Note: Only clone will be performed. If repository is already checked out
(and probably modified), it will not be updated. This prevents problems
with rewriting possible local modifications by ansible git module.

    divan_sops_age_recipients: ""
    divan_sops_age_private_key: ""
    divan_sops_ignore_mac: 'false'
    divan_sops_file_modtime: 'false'

Encryption settings for git-sops.

    divan_sops_probe_file: ""
    divan_sops_probe_text: ""

Relative path of the file used to check whether repository needs decryption.

    divan_sops_rename_keys: ""
    divan_sops_keep_formatting: ""
    divan_sops_encrypted_comment_prefix: ""
    divan_sops_encrypted_comment_suffix: ""
    divan_sops_yaml_indent: 4

Various git-sops settings w.r.t. yaml formatting.

    divan_sops_binary: /usr/local/bin/git-sops
Location of the `git-sops` binary.

    divan_sops_version: latest

Version of `git-sops` to use. Can be set to `latest` to auto-detect.

    divan_sops_upgrade: false

Normally, if git-sops is already installed, it will not be upgraded.
This flag enables overriding.

    divan_roles_dir: ~/devel/galaxy
    divan_roles_list_file: galaxy.yml
    divan_roles_check_role: ivansible.lin_base

The script will run `ansible-galaxy` and import roles from given `list file`
into given role `subdir`ectory if given `check role` does not exist.


    divan_galaxy_token: ""

Configure ansible-galaxy client with given token.


    divan_venv_dir: ~/.ansible/venv

Directory for ansible virtual environment.


    divan_skip_prepare: false

Set this to `true` if you have already run `dev_user` and `dev_ansible` roles.

    git_hub_release: latest

Release of the github client to install. Empty string will disable this step.

    git_hub_...: ...

Other settings for github client. You will rarely change these.


## Tags

- `divan_prepare_user` -- install SSH access keys, setup bash and git aliases
- `divan_prepare_ansible` -- install user-local ansible
- `divan_install_hub` -- install github cli
- `divan_checkout` -- checkout inventory and playbooks
- `divan_decrypt` -- decrypt secret files in the repository
- `divan_harden_secrets` -- harden file permissions in secret directories
- `divan_galaxy` -- galaxy login and role import
- `divan_ssh_config` -- add example of login settings for vagrant boxes
                        to `~/.ssh/config`
- `divan_links` -- create symbolic links for galaxy roles, requirements etc
- `divan_all` -- all of the above


## Dependencies

This role will invoke `ivansible.dev_user` with `dev_user_setup_system` enabled.

Note: Currently this dependency is **not** recorded in `meta/main.yml`.

You are also recommended to enable `dev_user_install_keys` in inventory,
else roles won't work (usually eligible for `permitted` inventory group).


## Example Playbook

    - hosts: vag2
      roles:
        - { role: ivansible.dev_ivantory }


## Testing

    ansible-playbook plays-all/run-role.yml -e role=ivansible.dev_ivantory -l vag2
    ./scripts/role.sh .dev-ivantory vag2


## License

MIT


## Author Information

Created in 2018-2021 by [IvanSible](https://github.com/ivansible)
