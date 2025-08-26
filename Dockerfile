FROM ubuntu:latest

USER root

RUN apt-get update && \
    apt-get install -y adduser sudo xterm git evince vim wget
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
RUN ./prerequisites.sh
RUN ./z3_build.sh
RUN ./sdl_install.sh
RUN ./sdl2_install.sh
RUN sudo apt-get install -y python3-pip python3-numpy python3-matplotlib python3-pil python3-sphinx python3-breathe
RUN ./gsl_build.sh
RUN ./graywolf_build.sh
RUN ./irsim_build.sh
RUN sudo apt-get install -y magic
RUN ./klayout_install.sh
RUN ./netgen_build.sh
RUN ./qrouter_build.sh
RUN ./ngspice44_build.sh
RUN sed '/cd xschem-gaw/{N;/\n\s*git pull/ s|$| && sed -i "s/GETTEXT_MACRO_VERSION = 0.18/GETTEXT_MACRO_VERSION = 0.20/" ./po/Makefile.in.in|}' ./xschem_build.sh | bash
RUN ./gtkwave_install.sh
RUN ./yosys_build.sh
RUN ./systemc_build.sh
RUN ./iverilog_build.sh
RUN ./verilator_build.sh
RUN ./qflow-1.4.100_etri050_build.sh
RUN sudo apt-get install -y octave
RUN sudo apt-get install -y libqt6charts6 && \
    wget -O /tmp/qucs.deb https://download.opensuse.org/repositories/home:/ra3xdh/xUbuntu_24.04/amd64/qucs-s_25.1.2-1_amd64.deb && \
    sudo dpkg -i /tmp/qucs.deb && \
    rm /tmp/qucs.deb

WORKDIR /home/user

CMD ["xterm"]
