Table of Contents for ansible-skeleton-vagrant
=================

   * [Table of Contents for skeleton](#table-of-contents-for-skeleton-skeleton)
      * [Design Highlights of the project:](#design-highlights-of-the-project)
      * [Setup instructions](#setup-instructions)
      * [Comments](#comments)


## Design Highlights of the project:
* Design decisions are documented beneath the **./doc/adr** using [Lightweight Architecture Decision Records](https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records), as used by Thoughtworks.
* The virtualbox base boxes beneath the **./base\_boxes** directory must be created BEFORE starting up the skeleton cluster beneath **./applications/skeleton** directory.  See the [Setup instructions](#setup-instructions) for more information. 
* After starting up your cluster, run the **./applications/skeleton/setupSshConnectivity.sh** to enable ssh and scp between your guest and host vms.   See the [Setup instructions](#setup-instructions) for more information. 

```
├── applications
│   └── skeleton
│       ├── environments
│       │   └── dev
│       │       ├── ansible.cfg
│       │       └── inventory
│       ├── plays
│       │   ├── ping.yml
│       │   └── test.yml
│       ├── roles
│       ├── setupSshConnectivity.sh
│       └── Vagrantfile
├── base_boxes
│   ├── oel6base
│   └── oel6base.skeleton
├── common
│   ├── plays
│   └── roles
│       ├── common-utility-installer
│       ├── dnsmasq-configurator
│       ├── dnsmasq-installer
│       ├── epel-6.8-repository-installer
│       ├── function
│       │   └── ansible-test-runner
│       ├── proxy-configurator
│       └── vagrant-base-cleaner
├── doc
│   └── adr
└── README.md
```

## Setup instructions
* Create the vagrant base boxes beneath **./base\_boxes**:
    * Go to **./base\_boxes/oel6base**
    * vagrant up
    * Run the createNewBasebox.sh as soon as the oel6base has completed without error.  This script will create a local vagrant base box called "oel6base" that subsequent "vagrant up" actions will use.  
    * Repeat the above steps for each of the other base boxes:  **./base\_boxes/oel6base-skeleton**

* Only after the base_boxes have all been created, then 
    * Go to **./applications/skeleton**
    * vagrant up --provision

* SSH onto machine872 the ansible controller:
    * vagrant ssh machine872
    * cd /vagrant/plays
    * ansible-playbook --diff -vv ping.yml
    * ansible-playbook test.yml

    There should be no error in any of the above.  The test.yml verifies that all skeleton nodes are wired successfully together

## Comments
* If you wish to ssh or scp, as opposed to simply using "vagrant ssh...", to your guest VMs from your host, then cd to the **./applications/skeleton** directory and type "**. ./setupSshConnectivity.sh**" which will create a special ssh config file and 2 aliases **sshv** and **scpv** that will connect to your vms from the host.  For example:  (1) **sshv machine3** would ssh onto machine3 instead of **vagrant ssh machine3**; (2) **scpv temp.file machine3:/tmp/temp.file** would scp a temp.file from your host to machine3's /tmp directory.
