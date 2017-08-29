#!/bin/bash

# Debug option gives a bash shell inside the container, instead of going directly to Zero-K
if [ "$1" == "--debug" ] ; then
  EXTRA_ARGS="-it"
  RS_COMMAND="/bin/bash" ;
else
  RS_COMMAND="mono /Zero-K/Chobby.exe" ;
fi

RS_USER=$(logname)
RS_UID=$(id -u $RS_USER)

xhost + # allow connections to X server

docker run --privileged --rm \
    -e "DISPLAY=unix:0.0" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "/etc/machine-id:/etc/machine-id" \
    -v "/run/user/${RS_UID}/pulse:/run/user/${RS_UID}/pulse" \
    -v ~/.pulse:"/home/${RS_USER}/.pulse" \
    -v "/etc/localtime:/etc/localtime" \
    -v "/root/Zero-K:/Zero-K" \
    ${EXTRA_ARGS} zero-k ${RS_COMMAND}

# Random forum post said to pass in /dev/shm and /var/lib/dbus as well, but works fine for me without them. Try those if there are portability problems
