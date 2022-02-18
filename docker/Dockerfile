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
    libftdi1 libusb-1.0-0-dev terminator telnet gnome-terminal protobuf-compiler sudo nano;

RUN apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release;

COPY pulse-client.conf /etc/pulse/client.conf

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
