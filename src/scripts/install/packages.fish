#!/usr/bin/env fish

for package in (cat "$RUNNING_DIR/resources/packages/yay.txt");
    yay -S --noconfirm "$package" || {
        echo "Failed to install $package to devbox"
        return 1
    }
end