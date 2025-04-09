#!/usr/bin/env bash

source "$RUNNING_DIR/scripts/install/helpers/functions/read_yn.bash"

# Get the username for the user to create
read -rp "Username to create: " NEW_USERNAME
export NEW_USERNAME=$NEW_USERNAME

# Get the password to user for this new user
read -rp "Password for new user [$NEW_USERNAME]: " -s NEW_USER_PASSWORD
export NEW_USER_PASSWORD="$NEW_USER_PASSWORD"

while true; do
    # Get user's dotfiles repo. This must be public for it to pull correctly.
    PROMPT="Would you like to clone a public dotfiles repo to the user's home?"
    if [[ $(read_confirm "$PROMPT") -eq 0 ]]; then
        break
    fi

    read -rp "Repo link: " DOTFILES_REPO_LINK

    # TODO: Add checks to see if repo is valid before proceeding.

    export DOTFILES_REPO_LINK="$DOTFILES_REPO_LINK"
    break
done