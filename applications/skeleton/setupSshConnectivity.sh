#!/usr/bin/env bash

vagrant ssh-config > vagrant-ssh-config
alias sshv="ssh -t -F vagrant-ssh-config"
alias scpv="scp -F vagrant-ssh-config"

