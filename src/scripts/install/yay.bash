#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing yay AUR helper"

# Install the necessary packages to install `yay`. All other packages will be
# installed
sudo -n pacman -Syy --needed --noconfirm git base-devel
# Make a temp folder to do the yay installation and move into it
pushd "$(mktemp -d)" >/dev/null || exit 1

# Return to the original directory if any errors are hit, or when this script
# exits in general
# TODO: Figure out if later scripts run outside of this one are affected by this
# call to `trap`.
trap '{ echo "Failed to install yay. Popping out of $(pwd)"; \
    popd >/dev/null; exit 1; }' \
    SIGINT SIGTERM ERR

# Clone, build, and install `yay`.
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg --install --syncdeps --noconfirm
popd >/dev/null || exit 1

echo "Finished installing yay AUR helper"
