#!/usr/bin/env fish

for package in (cat "$RUNNING_DIR/resources/yay.txt");
    yay -S --noconfirm $package || return
end