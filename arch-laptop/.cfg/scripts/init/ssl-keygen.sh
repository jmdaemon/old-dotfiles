#!/bin/bash

EMAIL=josephm.diza@gmail.com
GITLAB=gitlab.id_ed25519
GITHUB=github.id_rsa

SSH=$HOME/.ssh

ssh-keygen -t ed25519 -C $EMAIL -f $SSH/$GITLAB
ssh-keygen -t rsa -b 2048 -C $EMAIL -f $SSH/$GITHUB 
