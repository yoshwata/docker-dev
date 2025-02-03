ARG UBUNTU_RELEASE=noble

FROM docker.io/library/ubuntu:${UBUNTU_RELEASE} as base

ARG USER=yoshwata

# なぜかこれがないとUSERが渡らない
# RUN echo ${USER}

RUN apt-get update && \
	apt-get install sudo adduser -y && \
	adduser --disabled-password --gecos '' ${USER} && \
	adduser ${USER} sudo && \
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# install man pages, etc
RUN apt-get update && \
    apt-get install unminimize -y && \
    yes | unminimize && \
    rm -rf /var/lib/apt/lists

# squash image due to unminimize re-installing a lot of packages
FROM scratch
COPY --from=base / /

LABEL MAINTAINER jonathan-boudreau@protonmail.com

ENV UBUNTU_RELEASE=${UBUNTU_RELEASE}

ARG USER=yoshwata

# {{{ lang stuff

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
RUN apt-get update && \
	apt-get install -y language-pack-en-base && \
	rm -rf /var/lib/apt/lists/*

# }}}

# Required for `clear` command to work, etc.
ENV TERM screen-256color

ENV USER ${USER}

ENV HOME /home/${USER}

WORKDIR /home/${USER}

USER ${USER}

COPY prepare_docker.sh /tmp/prepare_docker.sh

RUN sudo bash /tmp/prepare_docker.sh ${USER} && \
	sudo rm /tmp/prepare_docker.sh

COPY build.sh /tmp/build.sh

COPY zshrc /tmp/zshrc

# USER root

RUN bash /tmp/build.sh ${USER} && \
	sudo rm /tmp/build.sh

# USER yoshwata

COPY ./inputrc "$HOME/.inputrc"

RUN sudo chown "$USER":"$USER" "$HOME/.inputrc"

CMD ["tmux", "new"]

ENV TMUX_VERSION 3.5

# COPY ./tmux.conf "$HOME/.config/tmux/tmux.conf"
COPY ./tmux-setup.sh /tmp/tmux-setup.sh

RUN bash /tmp/tmux-setup.sh ${USER} && sudo rm /tmp/tmux-setup.sh

ENV XDG_CONFIG_HOME "$HOME/.config"

COPY init.lua "$HOME/.config/nvim/init.lua"
COPY base-plugins.lua "$HOME/.config/nvim/lua/plugins/base.lua"

COPY ./.editorconfig "$HOME/.editorconfig"

COPY ./setup-nvim.sh /tmp/setup-nvim.sh

RUN bash /tmp/setup-nvim.sh && sudo rm /tmp/setup-nvim.sh

ENV IMAGE_CLASS=base

# fixes potential permission issues
RUN mkdir -p ~/workspace
