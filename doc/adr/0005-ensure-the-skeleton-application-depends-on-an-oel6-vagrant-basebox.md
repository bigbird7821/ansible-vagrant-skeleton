# 5. Ensure the skeleton application depends on an oel6 vagrant basebox

Date: 2018-02-16

## Status

Accepted

## Context

To minimize the possible difference between the ansible skeleton development environment and test or production, the development operating system should be as close as possible to the specification of test and live.  This implementation assumes an OEL6.9 variant.

However, there is a problem with using the raw OEL6.9 from Oracle: Booting up the skeleton application from scratch requires an unacceptable length of time for all the necessary software packages to be installed, restricting the ease of development.  In other words, if I want to destroy and rebuild my boxes again, then depending on the number of VMs it can take 20 to 30 minutes to restart.

## Decision

Therefore, a set of vagrant basebox's are now included beneath **./base_boxes**.  For example, **./base_boxes/oel6base** will take the raw OEL6.9 base box from oracle and create a new "oel6base" virtualbox base.  **./base_boxes/oel6base.skeleton** will take extend the new "oel6base" with all the extra software installations that your application development demands and create a new virtualbox base called "oel6base/skeleton".

## Consequences

Consequently, restarting a 5 VM environment from scratch has been reduced from 30 minutes to just over 5.  This is a much more acceptable time to rebuild your model environment.
