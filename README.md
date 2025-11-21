# Devbox

## Installation

Run the below command on a newly installed Arch system.

```bash
bash <(curl -sL https://raw.githubusercontent.com/GrimOutlook/devbox/refs/heads/main/init.bash)
```

The only required commands should be `curl`, `pacman`, and `bash` which should all be installed by default.

### WSL Quickstart
```bash
wsl --install --no-launch archlinux
wsl -d archlinux -- eval "bash <(curl -sL https://raw.githubusercontent.com/GrimOutlook/devbox/refs/heads/main/init.bash)"
```

## Additional tasks?

- Remove the `set -x` command from all file headers. Make this optional
  depending on user input. It clutters up the console quite a bit.
- Implement [`makepkg`
  optimizations](https://wiki.archlinux.org/title/Makepkg#Optimization)
- Install fish plugins
- Configure jujutsu
- https://github.com/sharkdp/bat/issues/977#issuecomment-1918497166
- Add global git pre-commit hooks
  - https://medium.com/@ripoche.b/using-global-pre-commit-hook-to-prevent-committing-unwanted-code-edbbf957ad12
  - Put https://github.com/sirwart/ripsecrets in this
