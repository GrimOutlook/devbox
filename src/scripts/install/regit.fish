#!/usr/bin/env fish

echo "Installing regit"

set REGIT_DIR_NAME "regit_Linux_x86_64"
set REGIT_TAR_NAME "$REGIT_DIR_NAME.tar.gz"
set REGIT_LINK "https://github.com/woaitsAryan/regit/releases/latest/download/$REGIT_TAR_NAME"

# Make a temp folder to do the yay installation and move into it
set TEMP_DIR (mktemp -d)
pushd $TEMP_DIR >/dev/null || {
    echo "Failed to push into temp directory [$TEMP_DIR]"
    return 1
}

# Return to the original directory if any errors are hit, or when this script
# exits in general
# TODO: Figure out if later scripts run outside of this one are affected by this
# call to `trap`.
trap '{
        popd >/dev/null;
        echo "Failed to install yay. Popping out of (pwd);"
        return 1;
    }' \
    INT TERM

wget $REGIT_LINK -O $REGIT_TAR_NAME || {
    echo "Failed to download regit from [$REGIT_LINK]"
    return 1
}
tar -xzf $REGIT_TAR_NAME || {
    echo "Failed to untar [$REGIT_TAR_NAME]"
    return 1
}
chmod +x "regit" || {
    echo "Failed to set execute bit on regit binary"
    return 1
}
sudo cp "regit" /usr/bin/ || {
    echo "Failed to copy regit binary to /usr/bin"
    return 1
}
popd >/dev/null || {
    echo "Failed to pop out of directory [$TEMP_DIR]"
    return 1
}

# Cleanup install files if desired
if set -u CLEANUP_INSTALL
    rm -rf "$TEMP_DIR"
end

echo "Finished installing regit"
