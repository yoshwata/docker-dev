#!/usr/bin/env bash

# Print out every line being run
set -x

# If a command fails, exit immediately.
set -e

user=$1

apt-install() {
	sudo apt-get install --no-install-recommends -y "$@"
}

install-tmux() {
	pushd /tmp
	local tmux_src="/tmp/tmux"
	git clone --branch "$TMUX_VERSION" --depth 1 https://github.com/tmux/tmux.git "$tmux_src"
	pushd "$tmux_src"
	# libevent is a run-time requirement. *-dev are for the header files.
	apt-install libevent-2.1-7 libevent-dev libncurses-dev autoconf automake pkg-config bison
	sh autogen.sh
	./configure --enable-static 
	make
	sudo make install
	popd
	rm -rf "$tmux_src"
	sudo apt-get purge -y libevent-dev libncurses-dev autoconf automake pkg-config bison
	popd
}

sudo apt-get update

# Fix file permissions from the copy
sudo chown -R ${user}:${user} "$HOME/.config"
# sudo chown ${user}:${user} /home/${user}/.config/tmux/tmux.conf

# Need to update package cache...
sudo apt-get update

install-tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# ~/.tmux/plugins/tpm/tpm
# ~/.tmux/plugins/tpm/bin/install_plugins

ls -la .
# Add fzf fuzzy finder
git clone https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Cleanup cache
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get autoremove -y
