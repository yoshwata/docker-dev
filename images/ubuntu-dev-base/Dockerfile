ARG UBUNTU_RELEASE=bionic

FROM ubuntu:${UBUNTU_RELEASE}

ARG UBUNTU_RELEASE
ARG USER=yoshwata

ENV UBUNTU_RELEASE=${UBUNTU_RELEASE}

#  TODO: user name should be customisable?
RUN echo $USER && \
	apt-get update && \
	apt-get install sudo -y && \
	adduser --disabled-password --gecos '' ${USER} && \
	adduser ${USER} sudo && \
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

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

ENV DOCKER_CLI_SHA256 "918372dd8cc56616b32b0f67432e2f6b4b27541728d6f9529543a5d73d955100"
ENV DOCKER_CLI_VERSION "18.09.3"

COPY build.sh /tmp/build.sh

RUN bash /tmp/build.sh ${USER} && \
	rm /tmp/build.sh

# For some reason, this environment variable isn't set by docker.
ENV USER $USER

ENV HOME /home/${USER}

WORKDIR /home/${USER}

USER ${USER}

COPY ./inputrc "$HOME/.inputrc"

RUN sudo chown "$USER":"$USER" "$HOME/.inputrc"

COPY user-setting.sh /usr/local/bin/user-setting.sh
RUN sudo chmod +x /usr/local/bin/user-setting.sh

ARG UID=1000
ARG GROUP=yoshwata
ARG GID=1000
RUN /usr/local/bin/user-setting.sh

CMD ["/bin/bash"]
