#!/usr/bin/env fish

if not set -q DOTFILES_REPO_LINK
    echo "No dotfiles repo to install..."
    return 0
end

echo "Installing dotfiles repo [$DOTFILES_REPO_LINK]"

set TEMP_DIR (mktemp -d)
pushd $TEMP_DIR >/dev/null || {
    echo "Failed to push into directory [$TMP_DIR]"
    return 1
}

# Return to the original directory if any errors are hit, or when this script
# exits in general
# TODO: Figure out if later scripts run outside of this one are affected by this
# call to `trap`.
trap '{
        echo "Failed to install dotfiles directory. Popping out of (pwd);"
        popd >/dev/null;
        return 1;
    }' \
    INT TERM

set DOTFILES_DIRECTORY "/home/$NEW_USERNAME/.dotfiles"

# Install the repo to .dotfiles in the new user's home directory.
git clone "$DOTFILES_REPO_LINK" $DOTFILES_DIRECTORY || {
    popd >/dev/null
    echo "Failed to pull down dotfiles repo [$DOTFILES_REPO_LINK]"
    return 1
}

# Run the install script if there is one
if test -f "$DOTFILES_DIRECTORY/install.sh"
    set INSTALL_SCRIPT "$DOTFILES_DIRECTORY/install.sh"
else if test -f "$DOTFILES_DIRECTORY/install.bash"
    set INSTALL_SCRIPT "$DOTFILES_DIRECTORY/install.bash"
else if test -f "$DOTFILES_DIRECTORY/install.fish"
    set INSTALL_SCRIPT "$DOTFILES_DIRECTORY/install.fish"
end

if set -q INSTALL_SCRIPT
    echo "Running install script [$INSTALL_SCRIPT]"
    chmod +x "$INSTALL_SCRIPT"
    "$INSTALL_SCRIPT" || {
        echo "Install script [$INSTALL_SCRIPT] from dotfiles repo [$DOTFILES_REPO_LINK] failed"
        return 1
    }
    echo "Finished running dotfiles install script [$INSTALL_SCRIPT]"
else
    echo "No install script to run for dotfiles repository."
    echo "Please move dotfiles from /home/$NEW_USERNAME/.dotfiles to the"
    echo "desired locations."
end

popd >/dev/null || {
    echo "Failed to pop out of directory [$TMP_DIR]"
    return 1
}

# Cleanup install files if desired
if set -u CLEANUP_INSTALL
    rm -rf "$TEMP_DIR"
end

echo "Finished installing dotfiles repo"