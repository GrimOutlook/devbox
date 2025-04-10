#!/bin/bash

function read_confirm() {
  while true; do

    read -r -p "$1 [y/n]: " yn

    echo "Yes No: $yn"

    case $yn in
      [yY] )
        return 1;;
      [nN] )
        return 0;;
      * ) echo "Only [y] or [n] are accepted";;
    esac

  done
}