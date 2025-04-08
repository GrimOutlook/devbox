#!/usr/bin/env fish

# TODO: Add this fix to the WSL config. [Source](https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL#systemd_requires_plain_cgroup_v2_support)
[wsl2]
kernelCommandLine = cgroup_no_v1=all systemd.unified_cgroup_hierarchy=1

# TODO: Make the default user the developer user