#!/usr/bin/env bash

# If one command exits with an error, stop the script immediately.
set -eo pipefail

# Print every line executed to the terminal.
set -x

sudo groupadd docker
user=$1
echo "build for user=${user}"
usermod -aG docker $user
