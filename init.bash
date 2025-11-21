#!/usr/bin/env bash

pacman -Syyuu --noconfirm git base-devel

cd $(mktemp -d)

git clone https://github.com/GrimOutlook/devbox.git

chmod +x -R devbox

bash devbox/src/install.bash
