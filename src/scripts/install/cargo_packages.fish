#!/usr/bin/env fish

set PACKAGE_FILE "$RUNNING_DIR/resources/packages/cargo.txt"
set PACKAGE_LIST (
    cat $PACKAGE_FILE | grep -v '#.*' | grep -v '^$'
)
for package in $PACKAGE_LIST;
    cargo install $package || {
        echo "Failed to install cargo package $package to devbox"
        return 1
    }
end