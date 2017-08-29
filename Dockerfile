FROM ubuntu:16.04

LABEL version "0.1"
LABEL description "Play Zero-K in a docker container!"
LABEL homepage "https://github.com/Densaugeo/??"
LABEL repository "https://github.com/Densaugeo/??"

# apt-transport-https - Zero-K download uses HTTPS
# xserver-xorg-video-all - return video to host
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    xserver-xorg-video-all

# Zero-K install instructions from https://zero-k.info/Wiki/Download
RUN apt-get install -y mono-complete libsdl2-2.0-0 libopenal1
RUN apt-get install -y wget
