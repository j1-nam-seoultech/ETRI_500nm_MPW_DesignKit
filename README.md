## GoodKook/ETRI-0.5um-CMOS-MPW-Std-Cell-DK Dockerize

https://github.com/GoodKook/ETRI-0.5um-CMOS-MPW-Std-Cell-DK

### Installed components

* [z3](https://github.com/Z3Prover/z3) 4.15.2
* [SDL](https://github.com/libsdl-org/SDL) 3.2.18
* SDL2 2.30.12
* python3
  * python3-pip
  * python3-pip
  * python3-numpy
  * python3-matplotlib
  * python3-pil
  * python3-sphinx
  * python3-breathe
* [gsl](https://www.gnu.org/software/gsl/) 2.8
* [graywolf](https://github.com/rubund/graywolf) 0.1.6
* [irsim](https://github.com/RTimothyEdwards/irsim) 9.7.119
* [magic](https://github.com/RTimothyEdwards/magic) 8.3.525
* [klayout](https://www.klayout.org) 0.30.0
* [netgen](https://github.com/RTimothyEdwards/netgen) 1.5.295
* [ngspice](https://sourceforge.net/projects/ngspice) 44
* [xschem](https://github.com/StefanSchippers/xschem) 3.4.7
* [gtkwave](https://sourceforge.net/projects/gtkwave) 3.3.120
* [yosys](https://github.com/YosysHQ/yosys) 0.55
* [systemc](https://github.com/accellera-official/systemc) 3.0.1
* [iverilog](https://github.com/steveicarus/iverilog) 12
* [verilator](https://github.com/verilator/verilator) 5.038
* [qucs-s](https://ra3xdh.github.io) 25.1.2
* qflow 1.4.100\_etri050
* vim
* evince
* octave

### Prerequirement

* Docker Desktop (https://docs.docker.com/get-started/get-docker/)
* X11 Server (ex: mobaXterm, xquartz)
* Git (https://git-scm.com/downloads)

### Microsoft Windows

* Install and run mobaXterm > Start X Server
* Acquire X Server DISPLAY environment value (ex: 192.168.0.1:0.0)
  * https://mobaxterm.mobatek.net/documentation.html#2_3_2

```
\> git clone https://github.com/j1-nam-seoultech/ETRI_500nm_MPW_DesignKit.git
\> run.bat 192.168.0.1:0.0
```

### Linux or macOS

* Install homebrew (https://brew.sh/)

```sh
$ brew install --cask xquartz
$ brew install socat
$ brew install git
$ git clone https://github.com/j1-nam-seoultech/ETRI_500nm_MPW_DesignKit.git
$ cd ETRI_500nm_MPW_DesignKit
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
$ ./run.sh 192.168.0.1:0.0
```
