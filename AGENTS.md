# AGENTS.md

> Instructions for AI agents operating in this dotfiles repository.

## Project Overview

This is a **personal dotfiles repository** managed via **GNU Stow**. It contains
configuration files for development tools, not application source code. There is
no build system, test suite, or CI pipeline.

**Primary platform**: Arch Linux | **Secondary**: macOS

### Repository Layout

```
dotfiles/
  nvim/          -> ~/.config/nvim/        Neovim + AstroNvim (Lua)
  zsh/           -> ~/.zshrc, ~/.config/zsh/  Zsh shell (modular conf.d/)
  tmux/          -> ~/.tmux.conf           Terminal multiplexer
  starship/      -> ~/.config/starship.toml  Shell prompt
  ghostty/       -> ~/.config/ghostty/     Terminal emulator
  opencode/      -> ~/.config/opencode/    Global OpenCode AI config (stow pkg)
  .opencode/     (project-specific OpenCode context, NOT stowed)
```

## Critical Constraints

1. **Never perform git operations** (stage, commit, push) on this repository
   unless the user explicitly asks.
2. **Ask for approval before running `stow`**. Use `stow -n <pkg>/` (dry-run)
   first to preview symlink changes.
3. **Never commit secrets or PII**. No API keys, tokens, or personal data in
   config files.
4. **No destructive operations** without explicit user approval (deleting files,
   overwriting configs, uninstalling packages).

## Deployment

```bash
cd ~/dotfiles
stow -n <package>/   # Dry-run: preview what symlinks will be created
stow <package>/      # Deploy: create symlinks to ~/ or ~/.config/
```

Packages use either XDG layout (`pkg/.config/pkg/...`) or direct home layout
(`pkg/.toolrc`). Follow the existing pattern for each package.

## Code Style Guidelines

- Keep configurations **readable**; add comments where they improve clarity.
- Follow each tool's **official configuration schema** and conventions.
- Ensure configs **support both Arch Linux and macOS** when the tool runs on
  both platforms.
- Reference current best practices. See the documentation freshness section.

### Lua (Neovim / AstroNvim)

Formatting: **Stylua** (`nvim/.config/nvim/.stylua.toml`) -- 2-space indent,
120 col width, Unix LF, auto-prefer double quotes, no call parentheses.
Linting: **Selene** (`nvim/.config/nvim/selene.toml`) with `std = "neovim"`.

**Plugin files must follow AstroNvim patterns** -- return a lazy.nvim spec table:

```lua
-- nvim/.config/nvim/lua/plugins/example.lua
---@type LazySpec
return {
  "author/plugin-name",
  opts = {
    -- configuration here
  },
}
```

Do NOT use generic `require("plugin").setup({})` patterns. Use AstroNvim's
integration modules (astrocore, astrolsp, astroui) for keybindings, LSP, and UI.

### Shell Scripts (Zsh / Bash)

- Use `#!/usr/bin/env bash` shebangs for portability.
- Include `set -e` in bash scripts for fail-fast behavior.
- Use descriptive section headers with comment blocks (see `opencode/install.sh`).
- Quote all variable expansions: `"$VAR"`, `"${array[@]}"`.
- Use `[[ ]]` for conditionals (not `[ ]`).
- Keep `.zshrc` minimal -- delegate to modular files in `conf.d/`:
  ```zsh
  # Load all modular zsh config files in order
  for file in "${HOME}/.config/zsh/conf.d"/*.zsh; do
    [[ -f "$file" ]] && source "$file"
  done
  ```
- Name modular configs descriptively: `exports.zsh`, `ohmyzsh.zsh`, etc.

### TOML Configuration (Starship, Stylua)

- Include the `$schema` key when the tool supports it.
- Group related settings under clear section headers (`[section]`).
- Use inline comments sparingly; prefer self-documenting key names.

### JSONC Configuration (OpenCode)

- Use JSONC (comments allowed) for OpenCode config files.
- Include `$schema` for validation: `"$schema": "https://opencode.ai/config.json"`.
- Keep structure flat and minimal; only override non-default values.

### Tmux

- One option per line, grouped logically (core settings, plugins, theme).
- Use `set -g` for global options.
- Place `run '~/.tmux/plugins/tpm/tpm'` as the last line.

### Ghostty

- Use `key = value` syntax (spaces around `=`).
- Only set options that differ from Ghostty defaults.
- Keep active config lines at the bottom, below any template comments.

### Naming Conventions

| Type             | Convention          | Examples                         |
|------------------|---------------------|----------------------------------|
| Stow packages    | lowercase tool name | `nvim`, `starship`, `tmux`       |
| Config files     | tool's convention   | `.zshrc`, `init.lua`, `config`   |
| XDG directories  | `.config/<tool>/`   | `.config/nvim/`, `.config/ghostty/` |
| Shell scripts    | descriptive verb    | `install.sh`, `setup.sh`         |
| Lua plugin files | feature name        | `astrocore.lua`, `treesitter.lua` |
| Zsh modules      | topic name          | `exports.zsh`, `ohmyzsh.zsh`    |

## Documentation Freshness

Dotfiles tools evolve rapidly. Always prefer **current-year documentation**.

| Source Age    | Reliability | Action                              |
|--------------|-------------|-------------------------------------|
| 2021 or older | Outdated   | Verify against current official docs |
| 2022-2023    | Validate    | Check for deprecated features        |
| 2024+        | Reliable    | Generally trustworthy                |

**Red flags** for outdated advice: references to vim-plug/pathogen, Vimscript
config examples, deprecated config keys, installation methods that fail on
current systems.

For Neovim questions, prefer **AstroNvim docs** (https://docs.astronvim.com/)
over generic Neovim guides. For core Neovim features, use the official docs
(https://neovim.io/doc/user/).

## Project Context Files

Detailed domain knowledge lives in `.opencode/context/project-intelligence/`:

- `technical-domain.md` -- Stack overview, deployment patterns, naming standards
- `documentation-policy.md` -- Full documentation freshness policy
- `neovim-astronvim.md` -- Neovim config patterns, plugin structure, LSP setup

Consult these files when making non-trivial changes to any package.

## Error Handling

- **Bash scripts**: Use `set -e`, validate inputs before acting, use `trap` for
  cleanup on exit. Provide clear error messages with context.
- **Lua configs**: Use `pcall` for fallible operations (see `nvim/.config/nvim/init.lua:19`).
- **Stow operations**: Always dry-run first (`stow -n`), backup before changes.
