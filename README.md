# Devbox

### Neovim

1. `git clone https://github.com/LunarVim/Launch.nvim.git ~/.config/nvim`
[gruvbox](https://github.com/ellisonleao/gruvbox.nvim)

### Podman

1. Podman should already be installed from the package TOML.

### Python

1. Python should already be installed from the package TOML.

## Additional tasks?

- Remove the `set -x` command from all file headers. Make this optional
  depending on user input. It clutters up the console quite a bit.
- Alias ripgrep to grep
- Alias nvim to v,vi,vim
- Alias batcat to cat
- Alias batcat with follow options to tail
- Make batcat the default pager for all programs
- Make batcat the default pager for man pages
- Implement [`makepkg`
  optimizations](https://wiki.archlinux.org/title/Makepkg#Optimization)
- Install fish plugins
- Configure jujutsu
- https://github.com/sharkdp/bat/issues/977#issuecomment-1918497166




#Function "md" to make and cd into a directory with one command md () { [ $# = 1
] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }