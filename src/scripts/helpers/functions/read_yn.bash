#!/bin/bash

function read_confirm() {
  while true; do

    read -r -p "$1 [y/n]: " yn

    case $yn in
      [yY] )
        return 0;;
      [nN] )
        return 1;;
      * ) echo "Only [y] or [n] are accepted";;
    esac

  done
}