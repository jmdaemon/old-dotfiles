#!/bin/bash

EMAIL=josephm.diza@gmail.com
GITLAB_KEY=gitlab.id_ed25519
GITHUB_KEY=github.id_rsa
SSH_DIR=$HOME/.ssh

ssh-keygen -t ed25519       -C $EMAIL -f $SSH_DIR/$GITLAB_KEY
ssh-keygen -t rsa -b 2048   -C $EMAIL -f $SSH_DIR/$GITHUB_KEY

ssh-add $SSH_DIR/$GITLAB_KEY
ssh-add $SSH_DIR/$GITLAB_PERSONAL_KEY
ssh-add $SSH_DIR/$GITHUB_KEY

# Test the keys afterwards with
# ssh -t git@gitlab.com
# ssh -t git@github.com
