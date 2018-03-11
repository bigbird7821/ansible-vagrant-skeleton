# 9. Keep common inventory and variables beneath the common directory and push changes to all applications

Date: 2018-03-11

## Status

Accepted

## Context

After creating multiple applications, it became apparent that to re-use the common roles and plays, there was also a requirment to use common variables and inventories.  In this skeleton, for example, there is a common setup of the pound load balancer and apache servers across all application evironments.  While the roles and plays to provision these softwares were located under the common directory; nevertheless, the inventory groups and variables associated with these softwares were being duplicated in each separate application.  Any changes to the common inventories or variables required a copy and paste across all the other applications.  Without doing this copy and paste, the applications would break.

Therefore the following decision was made to remove this duplication:

## Decision

* A bash script that is triggered by Vagrantfile on first provision will copy necessary "common" inventory and variables into the specific application environement locations.  
* Specific applications will then check-in the common configuration

## Consequences

The advantage of the above is that specific application environments are less likely to break:

* every environment works despite changes to common inventory or variable settings.
* common tests work for all environments
* if common settings are changed then they are easily detected by GIT or SVN because the local application versions also change
* common setting are not only translated to the application environments within vagrant and virtualbox, but they are also reflected in the test and production evironments as well.
