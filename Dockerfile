FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get -y update  && \
    apt-get -y install git && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y universe && \
    apt-get -y update && \
    apt-get -y install binutils fonts-freefont-ttf && \
    apt-get -y clean


RUN apt-get -y install libqt5core5a \
    libasound2-dev portaudio19-dev libmp3lame-dev libsndfile1-dev libportmidi-dev \
    libz-dev \
    libsndfile1 libsndfile1-dev \
    qtbase5-private-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools qttools5-dev \
    qttools5-dev-tools qtwebengine5-dev qtscript5-dev libqt5xmlpatterns5-dev libqt5svg5-dev libqt5webkit5-dev \
    libqt5x11extras5-dev  libqt5core5a libqt5gui5 libqt5network5 libqt5networkauth5-dev libqt5xml5 libqt5xmlpatterns5 libqt5printsupport5  \
    qml-module-qtquick-controls2 qml-module-qtquick-window2 qml-module-qtquick2 qml-module-qtgraphicaleffects qml-module-qtqml-models2 libqt5quicktemplates2-5 qtquickcontrols2-5-dev \
    cmake \
    build-essential \
    qml-module-qtquick-layouts qml-module-qt-labs-platform \
    qml-module-qtquick-dialogs \
    qml-module-qtquick-controls qml-module-qtquick-window2 qml-module-qtquick-pdf libssl-dev libpulse-dev libfreetype6-dev libfreetype6 && \
    apt-get -y clean

ENV MUS_VERSION=v4.2.0
RUN    cd /opt && \
       git clone https://github.com/musescore/MuseScore.git && \
       cd MuseScore && \
       git checkout $MUS_VERSION && \
       cmake  -P build.cmake -DCMAKE_BUILD_TYPE=Release install && cd /opt/MuseScore/builds/Linux-Qt-usr-Make-Release && cmake --install . --prefix /usr && \
       rm -rf /opt/MuseScore/

RUN rm -f /usr/bin/crashpad_handler
RUN apt-get -y install libasound2 alsa-utils  pavucontrol 
ENTRYPOINT ["mscore"]
