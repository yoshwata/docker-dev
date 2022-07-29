ARG BASE_TAG=bionic
ARG USER=yoshwata

ARG FROM_IMG=nvim
FROM ${USER}/${FROM_IMG}:$BASE_TAG

USER ${USER}

ENV NODENV_ROOT /home/yoshwata/.anyenv/envs/nodenv

RUN mkdir -p $HOME/.config/tmux && \
    git clone https://github.com/jonmosco/kube-tmux.git ~/.config/tmux/kube-tmux && \
    git clone https://github.com/anyenv/anyenv ~/.anyenv && \
    $HOME/.anyenv/bin/anyenv install --force-init && \
    mkdir -p $($HOME/.anyenv/bin/anyenv root)/plugins && \
    git clone https://github.com/znz/anyenv-update.git $($HOME/.anyenv/bin/anyenv root)/plugins/anyenv-update && \
    $HOME/.anyenv/bin/anyenv install nodenv && \
    eval "$($HOME/.anyenv/envs/nodenv/bin/nodenv init -)" && \
    $HOME/.anyenv/envs/nodenv/bin/nodenv install 16.13.2 && \
    $HOME/.anyenv/envs/nodenv/bin/nodenv local 16.13.2 && \
    $HOME/.anyenv/envs/nodenv/bin/nodenv global 16.13.2 && \
    $HOME/.anyenv/bin/anyenv install goenv && \
    export GOENV_ROOT="$HOME/.anyenv/envs/goenv" && \
    export PATH="$GOENV_ROOT/bin:$PATH" && \
    eval "$(goenv init -)" && \
    goenv install 1.18.3 && \
    goenv local 1.18.3 && \
    goenv global 1.18.3

CMD ["/bin/bash"]
