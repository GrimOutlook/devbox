#!/usr/bin/env bash

if test -z DOTFILES_REPO_LINK; then
  echo "No dotfiles repo to install..."
  return 0
fi

echo "Installing dotfiles repo [$DOTFILES_REPO_LINK]"

TEMP_DIR=$(mktemp -d)
pushd "$TEMP_DIR" >/dev/null || {
  echo "Failed to push into directory [$TEMP_DIR]"
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

DOTFILES_DIRECTORY="/home/$NEW_USERNAME/.dotfiles"

# Install the repo to .dotfiles in the new user's home directory.
git clone "$DOTFILES_REPO_LINK" "$DOTFILES_DIRECTORY" || {
  popd >/dev/null || return 1
  echo "Failed to pull down dotfiles repo [$DOTFILES_REPO_LINK]"
  return 1
}

# Run the install script if there is one
if test -f "$DOTFILES_DIRECTORY/install.sh"; then
  INSTALL_SCRIPT="$DOTFILES_DIRECTORY/install.sh"
elif test -f "$DOTFILES_DIRECTORY/install.bash"; then
  INSTALL_SCRIPT="$DOTFILES_DIRECTORY/install.bash"
fi

if test -n "$INSTALL_SCRIPT"; then
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
fi

popd >/dev/null || {
  echo "Failed to pop out of directory [$TEMP_DIR]"
  return 1
}

# Cleanup install files if desired
if test -n CLEANUP_INSTALL; then
  rm -rf "$TEMP_DIR"
fi

echo "Finished installing dotfiles repo"
