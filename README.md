# DOTFILES
Dotfiles for Mac

## Usage
```bash
git clone https://github.com/m8l91/mac-dotfiles.git
cd mac-dotfiles
./setup.sh
```

The setup script creates symlinks from this repo into your home directory. Existing files are backed up with a `.bak` extension before being replaced.

## What gets linked

| Source | Destination |
|---|---|
| `.vimrc` | `~/.vimrc` |
| `.zshrc` | `~/.zshrc` |
| `.zsh/` | `~/.zsh/` |
| `.hammerspoon/` | `~/.hammerspoon/` |
| `.warp/` | `~/.warp/` |
| `.config/goto` | `~/.config/goto` |
| `.config/helix` | `~/.config/helix` |
| `.config/iterm2` | `~/.config/iterm2` |
| `.config/neofetch` | `~/.config/neofetch` |
| `.config/starship.toml` | `~/.config/starship.toml` |
| `tmux/` | `~/.config/tmux` |
