ARG BASE_TAG=bionic
ARG USER=yoshwata

ARG FROM_IMG=nvim
FROM ${USER}/${FROM_IMG}:$BASE_TAG

USER ${USER}

ENV NODENV_ROOT /home/yoshwata/.anyenv/envs/nodenv

RUN git clone https://github.com/anyenv/anyenv ~/.anyenv && \
    $HOME/.anyenv/bin/anyenv install --force-init && \
    $HOME/.anyenv/bin/anyenv install nodenv && \
    eval "$($HOME/.anyenv/envs/nodenv/bin/nodenv init -)" && \
    $HOME/.anyenv/envs/nodenv/bin/nodenv install 12.20.1 && \
    $HOME/.anyenv/envs/nodenv/bin/nodenv local 12.20.1 && \
    $HOME/.anyenv/envs/nodenv/bin/nodenv global 12.20.1 && \
    $HOME/.anyenv/bin/anyenv install goenv && \
    export GOENV_ROOT="$HOME/.anyenv/envs/goenv" && \
    export PATH="$GOENV_ROOT/bin:$PATH" && \
    eval "$(goenv init -)" && \
    goenv install 1.15.6 && \
    goenv local 1.15.6 && \
    goenv global 1.15.6

CMD ["/bin/bash"]
