# 6. Vagrant provision should only initialize the VMs and run ping playbook

Date: 2018-02-27

## Status

Accepted

## Context

On "vagrant up", a full provisioning of the servers including installation and configuration of all software, can take a number of minutes which wastes time if we just want to get onto the servers and run small incremental provisioning scripts.  Not only this, but a dependence on the "vagrant up" to do all ansible provisioning often means the developer can lose touch with the raw command-line ansible.

## Decision

Therefore, "vagrant provision" should only do a minimal provision, just enough to get the ansible command-line ready to use.  From the command line then all necessary installation, configuration and test playbooks should then be run.

## Consequences

Consequently, incremental software installations can be achieved without waiting for everything else to complete as well.
