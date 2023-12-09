# ansible
ansible playbooks

## usage
* installation of ansible via `sh install.sh`
* example playbook: `ansible-playbook update.yaml { -i custom_inventoryfile }{ -l local } { --ask-become-pass }`

## roles:
* common: fishshell, nvim, ...
* server: docker, qemu-guest-agent(proxmox)
* update
