#!/bin/bash
# example usage: ./mountssh.sh 127.0.0.1 root
mkdir -p "/Volumes/sshfs/$1";
sshfs "$2@$1:/" "/Volumes/sshfs/$1" -ovolname=$1 && open "/Volumes/sshfs/$1"
