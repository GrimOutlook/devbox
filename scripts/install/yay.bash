#!/usr/bin/env bash

# Install the necessary packages to install `yay`. All other packages will be
# installed
pacman -S --needed --noconfirm git base-devel
# Make a temp folder to do the yay installation
pushd `mktemp -d` >/dev/null

# Return to the original directory if any errors are hit, or when the script exits in general
trap \
 "{ popd > /dev/null; exit 255; }" \
 SIGINT SIGTERM ERR EXIT

# Clone, build, and install `yay`.
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
popd >/dev/null
