#!/usr/bin/env bash

pacman -Syyuu git base-devel

cd $(mktemp -d)

git clone https://github.com/GrimOutlook/devbox.git

chmod +x -R devbox

bash devbox/install.bash
