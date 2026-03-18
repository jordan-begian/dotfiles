# dotfiles

Personal development environment configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

**Platforms**: Arch Linux · macOS

## Packages

| Package | Target | Description |
|---------|--------|-------------|
| `nvim` | `~/.config/nvim/` | Neovim via [AstroNvim](https://astronvim.com/) v5+ |
| `zsh` | `~/.zshrc`, `~/.config/zsh/` | Zsh with modular config in `conf.d/` |
| `tmux` | `~/.tmux.conf` | Tmux with [tpm](https://github.com/tmux-plugins/tpm) plugins |
| `starship` | `~/.config/starship.toml` | [Starship](https://starship.rs/) shell prompt |
| `ghostty` | `~/.config/ghostty/` | [Ghostty](https://ghostty.org/) terminal emulator |
| `opencode` | `~/.config/opencode/` | Global [OpenCode](https://opencode.ai/) AI config, set up with the [OpenAgents Control](https://github.com/darrenhinde/OpenAgentsControl) framework (agents, commands, skills, tools) |

## Installation

Clone and stow any package:

```bash
git clone https://github.com/<user>/dotfiles ~/dotfiles
cd ~/dotfiles

stow nvim/       # deploy a single package
stow nvim zsh tmux starship ghostty opencode  # deploy multiple
```

Preview symlinks before applying with a dry run:

```bash
stow -n nvim/
```

## Structure

Packages follow either XDG (`pkg/.config/pkg/`) or home (`pkg/.toolrc`) layout
depending on the tool. Stow handles creating the correct symlinks from `~/dotfiles`
into `~` or `~/.config/`.

The `.opencode/` directory contains project-specific AI agent context for this
repo and is not stowed.
