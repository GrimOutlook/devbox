#!/usr/bin/env bash

echo "Setting up SSH"

KEYS="$HOME/.ssh/keys"
mkdir -p "$KEYS"

ssh-keygen -f "$KEYS/github" -N ""

cat > "$HOME/.ssh/config" << EOF
Host github.com
    IdentityFile $HOME/.ssh/keys/github
EOF

echo "Finished setting up SSH"
