# 9. Keep common inventory and variables beneath the common directory and push changes to all applications

Date: 2018-03-11

## Status

Accepted

## Context

After creating multiple applications, it became apparent that not only roles and plays need to be reused across applications, but also variables and inventory groups.  There are a couple of scenarios that require highlight the need for a common set of variables and inventory groups:

* If all applications require a common set of packages like a pound load balancer and a set of apache servers, then there will also be a need for a common set of ansible inventory groups [pound] and [apache].  Unless there is a way to define these groups for all application in one location, then the groups must be duplicated in each application.  If this duplication is a manual process, then it is likely that some changes will not be replicated correctly and applications will break.
* Similary with common variables, especially those that need to live outside the default location for a role.  For example, the **proxy_configurator_no_proxy** variable defines the list of NO_PROXY hosts for an infrastructure and is used in a number of different roles, the yum configuration, the http_proxy configuration, and the docker configuration.  As a result, it cannot simply reside in the one of these default roles; it must be available to all roles that require it.  Since this variable is the same for all applications in all environments, there needs to be a mechanism to share it everywhere.
* Although, a common definition of variables and inventory groups might work fine for vagrant and virtualbox since all applications are conveniently defined together.  The situation is not quite so easy when deploying the individual applications to other environments like test and live.  Here in these environments there is still a need for a local copy of the common configuration otherwise these deployments will fail.

## Decision

Therefore it was decided to keep all common configuration, like inventory group definitions and variables, in one place and then have a bash script, triggered by the Vagrantfile on first provision,  copy the common configuration into each and every specific application, including each of its dev, test and production environment locations. If the common configuration changes then it will, along with all the duplicates in each application and environment, be checked into git.  Thus deployments will always, in theory, have the correct common configuration.

## Consequences

The advantage of the above is that specific application environments are less likely to break:

* every environment works despite changes to common inventory or variable settings.
* common tests work for all environments
* if common settings are changed then they are easily detected by GIT or SVN because the local application versions also change
* common settings are not only translated to the application environments within vagrant and virtualbox, but they are also reflected in the test and production evironments as well.

Another consequence is that there is now not just 1 skeleton application but 2.  The reason for this is that to confirm that your common settings work across all application environments, you need at least 2 applications to spin up and verify a successful build.
