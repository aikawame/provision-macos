#!/bin/bash

/opt/homebrew/bin/ansible-playbook -i local local.yml --ask-vault-pass
