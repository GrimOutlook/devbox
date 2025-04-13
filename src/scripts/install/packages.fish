#!/usr/bin/env fish

set PACKAGE_FILE "$RUNNING_DIR/resources/packages/yay.txt"
set PACKAGE_LIST (
    cat $PACKAGE_FILE | grep -v '#.*' | grep -v '^$'
)
for package in $PACKAGE_LIST;
    yay -S --noconfirm "$package" || {
        echo "Failed to install $package to devbox"
        return 1
    }
end