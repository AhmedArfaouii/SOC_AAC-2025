# SOC-as-Code Lab

Vagrant + Ansible stack with Suricata IDS + Filebeat + ELK.

## Usage
1. vagrant up
2. ansible-playbook -i inventories/dev/hosts.yml playbooks/elk.yml
3. ansible-playbook -i inventories/dev/hosts.yml playbooks/ids.yml

