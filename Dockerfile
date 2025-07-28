FROM ubuntu:latest

USER root

RUN apt-get update && \
    apt-get install -y adduser sudo xterm git evince vim
RUN adduser --disabled-password --gecos "" user && \
    echo 'user:user' | chpasswd && \
    adduser user sudo && \
    echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user

WORKDIR /home/user
RUN git clone https://github.com/GoodKook/ETRI-0.5um-CMOS-MPW-Std-Cell-DK.git && \
    ln -s ETRI-0.5um-CMOS-MPW-Std-Cell-DK ~/ETRI050_DesignKit && \
    chmod +x ~/ETRI050_DesignKit/Tools/*.sh

WORKDIR /home/user/ETRI050_DesignKit/Tools
RUN ./prerequisites.sh && \
    ./build_tools.sh

WORKDIR /home/user
RUN sudo apt-get install -y octave

CMD ["xterm"]
