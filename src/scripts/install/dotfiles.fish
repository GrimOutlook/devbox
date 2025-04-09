#!/usr/bin/env fish

if not set -q DOTFILES_REPO_LINK
    echo "No dotfiles repo to install..."
    return 0
end

set TEMP_DIR (mktemp -d)
pushd $TEMP_DIR >/dev/null

# Return to the original directory if any errors are hit, or when this script
# exits in general
# TODO: Figure out if later scripts run outside of this one are affected by this
# call to `trap`.
trap '{ echo "Failed to install dotfiles directory. Popping out of (pwd);" \
    popd >/dev/null; return 1; }' \
    INT TERM

# Install the repo to .dotfiles in the new user's home directory.
git clone "$DOTFILES_REPO_LINK" /home/$NEW_USERNAME/.dotfiles ||
    echo "Failed to pull down dotfiles repo [$DOTFILES_REPO_LINK]" &&
    popd >/dev/null &&
    return 1

# Run the install script if there is one
if test -f "$DOTFILES_REPO_LINK/install.sh"
    ./"$DOTFILES_REPO_LINK/install.sh"
else if test -f "$DOTFILES_REPO_LINK/install.bash"
    ./"$DOTFILES_REPO_LINK/install.bash"
else if test -f "$DOTFILES_REPO_LINK/install.fish"
    ./"$DOTFILES_REPO_LINK/install.fish"
else
    echo "No install script to run for dotfiles repository."
    echo "Please move dotfiles from /home/$NEW_USERNAME/.dotfiles to the"
    echo "desired locations."
end

popd >/dev/null