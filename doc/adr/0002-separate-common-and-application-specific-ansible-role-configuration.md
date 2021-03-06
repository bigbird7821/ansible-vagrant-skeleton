# 6. Separate common and application specific ansible role configuration

Date: 2018-03-01

## Status

Accepted

## Context

Although software tools like consul, dnsmasq, and kibana are useful toolsets for many different infrastructure scenarios, nevertheless these tools and others often require both a common and very specific sets of configurations.  For example, I may want to have very specific kibana visualizations in the yyy-app application that I don't want in the zzz-app application.  Likewise, I may want to have a common set of infrastructure monitoring kibana visualizations in both applications.

## Decision

Therefore, purely common ansible role configuration will live in the **./common/roles** directory; whereas application specific configuration will live in application specific role locations, e.g., **./applications/skeleton/roles**, **./applications/rsqe/roles** or **./applications/gsp/roles**.

## Consequences

Consequently, ansible configuration will be less congested with unnecessary code.  For example now, yyy-app kibana visualizations will not be deployed to the xxx-app kibana and not clutter the xxx-app code base.