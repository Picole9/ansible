# ansible
ansible playbooks

## usage
* installation of ansible via `sh install.sh`
* example playbook: `ansible-playbook update.yaml -i custom_inventoryfile -l local --ask-become-pass --extra-vars "http_proxy=http://my-proxy.com"`
* default variables in group\_vars/all or role-specific in roles/{role}/vars/

## roles:
* common (arch, debian)
    * dotfiles
    * common
    * glow
    * nvim
    * fish
* server (arch, ubuntu)
    * docker
* update (arch, debian)
    * update (packages, fisher, tldr)
