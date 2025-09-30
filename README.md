# ansible
ansible playbooks

## install ansible
* installation of ansible via `sh install.sh`
* test-facts: `ansible -m setup localhost`

## usage
* example playbook: `ansible-playbook site.yaml`
    * `-i custom_inventoryfile -l local` or `-i user@address,`
    * `--ask-become-pass`
    * `--ask-pass`
    * `--extra-vars "http_proxy=http://my-proxy.com"`
    * `--tags update`
* variables in `group\_vars/all` or role-specific in `roles/{role}/vars/`
* run a single role with `ansible-playbook run_role.yaml -i user@address, --extra-vars "role=common"`

### tags
* list possible tags `ansible-playbook site.yaml --list-tags`
    * install: installation related tasks
    * configure: configuration related tasks
    * update: update related tasks
    * always: need to run every time
