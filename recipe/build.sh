#!/bin/bash

if [[ $target_platform != "linux-aarch64" ]]; then
  USERNAME=$(id -u -n)
  Xvfb :1 -screen 0 1280x1024x24 -auth localhost &
  export DISPLAY=:1
fi

$PYTHON setup.py install --single-version-externally-managed --record record.txt

if [[ $target_platform != "linux-aarch64" ]]; then
  unamestr=`uname`
  if [ "$unamestr" != 'Darwin' ]; then
    killall -u $USERNAME Xvfb
  fi
fi
