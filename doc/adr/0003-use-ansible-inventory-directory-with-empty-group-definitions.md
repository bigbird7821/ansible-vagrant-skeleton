# 3. Use ansible inventory directory with empty group definitions

Date: 2018-01-30

## Status

Accepted

## Context

When working with more complex infrastructures and orchestrations, inventory groupings can become complicated if managed in a single inventory file. Fortunately, ansible allows inventory to be configured not only with a single file, like hosts.ini, but also with a directory of files like ./inventory{usa-hosts,uk-hosts,canada-hosts}.

## Decision

Therefore, the inventory directory was chosen to allow at least 2 inventory files:  one to define the groups without any IP addresses and the other to add IPs to the groups.

## Consequences

Consequently, it is easy now to create separate IP definition inventory files to ease configuration of different geographical locations.  For example, if ./inventory contains all the inventory files and a single group [apache] is defined, then geographical datacentre inventory files can be defined, e.g., ./inventory/usa-hosts and ./inventory/uk-hosts.  If you have IPs defined for [apache] in both these inventory files, then all the IPs will be considered in the "apache" group.  However, if you only wish to enable the uk-hosts, then simply remove the ./inventory/usa-hosts.