# Task 4: Ansible — Fleet Management Playbook

## Approach

A single playbook handles both OS families using `ansible_os_family` conditionals.
This keeps the logic in one place rather than splitting into separate playbooks or role hierarchies, which would be over-engineering for this scope.

The playbook follows a deliberate ordering:
1. Gather facts (collect OS info to enable conditional logic)
2. Update repos
3. Upgrade packages
4. Deploy OS-specific services

The handler pattern for Apache restarts means the service only restarts when the HTML page actually changes, avoiding unnecessary restarts on repeated runs.

## Prerequisites

Edit inventory.ini with your actual hosts.
Make sure you have ssh keys and access to the hosts.

## Usage

```bash
# make sure the inventory and the playbook are okay
ansible-playbook -i inventory.ini playbook.yaml --check --diff

# deploy
ansible-playbook -i inventory.ini playbook.yaml
```
