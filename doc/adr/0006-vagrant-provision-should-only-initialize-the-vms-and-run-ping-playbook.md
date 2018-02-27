# 6. Vagrant provision should only initialize the VMs and run ping playbook

Date: 2018-02-27

## Status

Accepted

## Context

There are a number of problems currently because we depend on varant to run the complete ansible setup suite:
* Wasted time 
* Long execution for small code tests
* Developer becomes depended on vagrant rather than learning ansible

## Decision

Because of above problems, we've decided to only run ansible execution within the ansible controller beneath the /vagrant/plays directory

## Consequences

The consequences of this are better skilling of the ansible suite
