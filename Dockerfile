ARG DOCKER_SRC

FROM $DOCKER_SRC
LABEL maintainer="Davide De Tommaso <davide.detommaso@iit.it>"

ENV TZ=Europe/Rome
ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update

RUN apt-get install -y apt-utils x11-apps gnupg swig alsa-utils \
    libace-dev libc6 python3 python3-dev python3-pip \
    libgsl0-dev libncurses5-dev libsdl1.2-dev \
    subversion git gfortran cmake libxmu-dev \
    libode-dev wget unzip \
    qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev \
    libqt5svg5 libqt5opengl5-dev \
    libopencv-dev freeglut3-dev libtinyxml-dev \
    libblas-dev coinor-libipopt-dev liblapack-dev \
    libmumps-dev qml-module-qtmultimedia \
    qml-module-qtquick-dialogs qml-module-qtquick-controls \
    libedit-dev libeigen3-dev libjpeg-dev libsimbody-dev \
    libxml2-dev openssh-server openssh-client psmisc \
    mesa-utils net-tools iputils-ping lsb-release mcedit \
    libssl-dev cmake-curses-gui;

RUN apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-tools \
    gstreamer1.0-plugins-ugly pulseaudio-utils libdlib-dev libsqlite3-dev \
    libftdi1 libusb-1.0-0-dev terminator telnet gnome-terminal protobuf-compiler sudo;

RUN useradd -ms /bin/bash docky
RUN echo 'docky:docky' | chpasswd
RUN echo 'root:root' | chpasswd

WORKDIR /home/docky
COPY pulse-client.conf /etc/pulse/client.conf

USER docky

RUN cd /home/docky &&\
    git clone https://github.com/s4hri/docker-tests;

ENV PATH=${PATH}:/home/docky/.local/bin

RUN mkdir /home/docky/.config && mkdir /home/docky/.config/terminator && touch mkdir /home/docky/.config/terminator/config
