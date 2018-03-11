# 6. Vagrant provision should only initialize the VMs and run ping playbook

Date: 2018-02-27

## Status

Accepted

## Context

There are a number of problems currently because we currently configure vagrant to run a complete ansible provisioning suite. There are a number of problems with this approach:

* A full provisioning can take minutes which wastes time if we just want to get onto the servers and run small incremental provisioning scripts.  We waste time waiting for everything to run when we just want to run a portion.
* Developer becomes dependent on "vagrant provision" instead of logging onto the ansible controller and using the command-line ansible-playbook statements.  The problem with this is that the developer may lose touch with the raw command-line ansible usage.

## Decision

Because of above problems, we decided:

* to have "vagrant provision" only do a minimal provision, just enough to get the ansible controller ready to use.  For example, the environment is setup with necessary http_proxy and a sanity ping test is run against all servers.
* to force developers, once the initial ping vagrant provision has completed, to log onto the ansible controller and then run the install.yml, the configure.yml and test.yml beneath the /vagrant/plays directory

## Consequences

The consequences of this are better skilling of the ansible suite
