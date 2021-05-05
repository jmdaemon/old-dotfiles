#!/bin/bash

git config --global alias.stash-unapply '!git stash show -p | git apply -R'
# Usage: git stash-unapply
