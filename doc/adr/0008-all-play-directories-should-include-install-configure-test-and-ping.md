# 8. All play directories should include install, configure, test, and ping

Date: 2018-03-10

## Status

Accepted

## Context

As common functionality is refactored out of specific application roles, then so should there be no duplication of the plays that include and test these roles.  

Therfore the following decision was made:

## Decision

There should be a common set of install.yml, configure.yml, and test.yml plays.  For example, **./applications/eureka/plays/configure.yml** will first reference the **./applicaitons/common/plays/configure.yml**, and then do its own specific configuration actions.

```yaml
---
# Perform common configuration
- import_playbook: /opt/skeleton/ansible/common/plays/configure.yml

# Perform application specific configuration
- name: Configure Hashistack
  hosts: hashistack
  roles:
    - consul-configurator
```

The directory structure looks something like this:

```bash
.
├── applications
│   ├── eureka
│   │   ├── plays
│   │   │   ├── configure.yml
│   │   │   ├── install.yml
│   │   │   ├── ping.yml
│   │   │   └── test.yml
│   │   ├── roles
│   │   │   └── application-utility-installer
│   └── skeleton
│       ├── plays
│       │   ├── configure.yml
│       │   ├── install.yml
│       │   ├── ping.yml
│       │   └── test.yml
│       ├── roles
│       │   └── application-utility-installer
├── common
│   ├── plays
│   │   ├── configure.yml
│   │   ├── install.yml
│   │   ├── ping.yml
│   │   └── test.yml
│   └── roles
│       ├── apache-configurator
│       ├── apache-installer
│       ├── pound-configurator

```

For example, the following is an example of the specific application configure.yml.  Notice how it first references the common configure.yml and then does its own:

Similarly, the install.yml and test.yml will be linked to the common and contain its own specific configuration.

## Consequences

There should be a reduction in duplicated code; one place to change the installation, configuration, and test ansible code for the common.