ARG BASE_TAG=bionic
ARG USER=yoshwata

FROM ${USER}/power-tmux:$BASE_TAG

USER ${USER}

COPY ./build.sh /tmp/build.sh

COPY ./bashrc-additions.sh /tmp/bashrc-additions.sh

COPY init.vim "$HOME/.config/nvim/init.vim"
COPY plugin.vim "$HOME/.config/nvim/plugin.vim"
COPY post-plugin.vim "$HOME/.config/nvim/post-plugin.vim"

COPY ./ycm-install /usr/local/bin/ycm-install

RUN /tmp/build.sh ${USER} && \
	sudo rm /tmp/build.sh

CMD ["bin/bash"]

