#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 [DISPLAY]"
    echo "example: $0 192.168.0.5:0.0"
    exit 1
fi

DISPLAY_ARG="$1"
HOME_DIR="$HOME"
WORKSPACE_DIR="$HOME_DIR/etri_designkit_workspace"

if [ ! -d "$WORKSPACE_DIR" ]; then
    echo "Creating directory: $WORKSPACE_DIR"
    mkdir -p "$WORKSPACE_DIR"
fi

docker run -it --rm \
    -e DISPLAY="$DISPLAY_ARG" \
    -e TZ=Asia/Seoul \
    -v "$WORKSPACE_DIR:/home/user/etri_designkit_workspace" \
    etri-designkit:latest
