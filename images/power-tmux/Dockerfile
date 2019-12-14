ARG BASE_TAG=bionic
ARG USER=yoshwata
ARG FROM_IMG=ubuntu-dev-base

# FROM ${USER}/ubuntu-dev-base:$BASE_TAG
FROM ${USER}/${FROM_IMG}:$BASE_TAG

USER ${USER}

ENV XDG_CONFIG_HOME "$HOME/.config"

COPY ./powerline "$HOME/.config/powerline"

COPY ./.tmux.conf "$HOME/.tmux.conf"

COPY ./bashrc-additions.sh /tmp/bashrc-additions.sh

COPY ./.tmate.conf "$HOME/.tmate.conf"

ENV TMUX_VERSION 2.9

COPY ./build.sh /tmp/build.sh

RUN bash /tmp/build.sh $USER && \
	sudo rm /tmp/build.sh

CMD ["bin/bash"]

