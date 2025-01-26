# ansible
ansible playbooks

## usage
* installation of ansible via `sh install.sh`
* example playbook: `ansible-playbook update.yaml`
    * `-i custom_inventoryfile -l local`
    * `-i user@address,`
    * `--ask-become-pass`
    * `--ask-pass`
    * `--extra-vars "http_proxy=http://my-proxy.com"`
* default variables in group\_vars/all or role-specific in roles/{role}/vars/

## roles:
* common (arch, debian)
    * common
    * fish
    * glow
    * nvim
* server (arch, ubuntu)
    * docker
* update (arch, debian)
    * update (packages, fisher, tldr)
