#!/usr/bin/env fish

echo "Installing regit"

set REGIT_DIR_NAME "regit_Linux_x86_64"
set REGIT_TAR_NAME "$REGIT_DIR_NAME.tar.gz"
set REGIT_LINK
"https://github.com/woaitsAryan/regit/releases/latest/download/$REGIT_TAR_NAME"

# Make a temp folder to do the yay installation and move into it
pushd (mktemp -d) >/dev/null || exit 1

# Return to the original directory if any errors are hit, or when this script
# exits in general
# TODO: Figure out if later scripts run outside of this one are affected by this
# call to `trap`.
trap '{ echo "Failed to install yay. Popping out of (pwd);" \
    popd >/dev/null; exit 1; }' \
    SIGINT SIGTERM ERR

pushd
wget $REGIT_LINK -O $REGIT_TAR_NAME || return
tar -xzf $REGIT_TAR_NAME || return
chmod +x "regit"
cp "regit" /usr/bin/
popd >/dev/null || exit 1

echo "Finished installing regit"
