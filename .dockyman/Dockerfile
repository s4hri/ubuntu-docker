ARG DOCKER_SRC

FROM ${DOCKER_SRC} AS base
LABEL maintainer="Davide De Tommaso <davide.detommaso@iit.it>, Adam Lukomski <adam.lukomski@iit.it>"

ENV DEBIAN_FRONTEND noninteractive

ARG USER
ARG LOCAL_USER_ID
ARG GROUP_AUDIO
ARG GROUP_VIDEO
ARG GROUP_INPUT

USER root

ENV USER=${USER}
ENV LOCAL_USER_ID=${LOCAL_USER_ID}
ENV GROUP_INPUT=${GROUP_INPUT}
ENV GROUP_VIDEO=${GROUP_VIDEO}
ENV GROUP_AUDIO=${GROUP_AUDIO}

RUN if grep -c ${USER}: /etc/passwd ; then \
    echo "User exists" && usermod -u ${LOCAL_USER_ID} ${USER}; \
    else echo "User not found" && useradd -ms /bin/bash ${USER} && echo ${USER}:${USER} | chpasswd && echo 'root:root' | chpasswd; \
    fi

RUN if [ $(getent group audio) ]; then groupmod -o audio --gid ${GROUP_AUDIO}; else groupadd audio --gid ${GROUP_AUDIO}; fi
RUN if [ $(getent group video) ]; then groupmod -o video --gid ${GROUP_VIDEO}; else groupadd video --gid ${GROUP_VIDEO}; fi
RUN if [ $(getent group input) ]; then groupmod -o input --gid ${GROUP_INPUT}; else groupadd input --gid ${GROUP_INPUT}; fi

RUN usermod -a -G root,sudo,${GROUP_AUDIO},${GROUP_VIDEO},${GROUP_INPUT} ${USER}

WORKDIR /workdir

ENV PATH=${PATH}:/home/${USER}/.local/bin:/workdir
USER ${USER}
