#!/bin/bash

USER=${USER:-"yoshwata"}
USER_ID=${UID:-1000}
GROUP=${GROUP:-"yoshwata"}
GROUP_ID=${GID:-1000}

echo "Starting with USER : $USER"
echo "Starting with UID : $USER_ID"
echo "Starting with GROUP : $GROUP"
echo "Starting with GID : $GROUP_ID"
sudo groupmod -g $GROUP_ID $GROUP
sudo usermod -u $USER_ID -g $GROUP_ID -o yoshwata

