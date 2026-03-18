<!-- Context: project-intelligence/technical | Priority: critical | Version: 1.0 | Updated: 2026-03-18 -->

# Technical Domain

**Purpose**: Configuration management stack, deployment patterns, and organizational standards for personal dotfiles repository.
**Last Updated**: 2026-03-18

## Quick Reference
**Update Triggers**: New tools added | Configuration patterns change | Cross-platform requirements change
**Audience**: System administrators, dotfiles maintainers, AI agents

## Configuration Stack
| Layer | Technology | Purpose | Notes |
|-------|-----------|---------|-------|
| Management | GNU Stow | Symlink deployment | cd ~/dotfiles && stow package-name/ |
| Structure | XDG Base Directory | Standard locations | .config/ when supported |
| Tools | Evolving | Current: nvim, starship, opencode, ghostty, tmux, zsh | Stack grows with new tools |
| Editor | Neovim + AstroNvim | Primary editor config | Template-based configuration |

## Deployment Patterns
### Stow Package Structure
```bash
# Mixed patterns based on tool requirements
# XDG-compliant tools (.config/)
nvim/.config/nvim/config-file -> ~/.config/nvim/config-file

# Direct home tools (~/)
tmux/.tmux.conf -> ~/.tmux.conf
```

### Deployment Process
```bash
cd ~/dotfiles
stow package-name/    # Creates symlinks to appropriate locations
```

## Current Packages
| Package | Target Location | Type | Description |
|---------|----------------|------|-------------|
| nvim | ~/.config/nvim/ | XDG | AstroNvim configuration (template-based) |
| starship | ~/.config/starship.toml | XDG | Shell prompt |
| opencode | ~/.config/opencode/ | XDG | Global OpenCode AI config, set up with the [OpenAgents Control](https://github.com/darrenhinde/OpenAgentsControl) framework (agents, commands, skills, tools) |
| ghostty | ~/.config/ghostty/ | XDG | Terminal emulator |
| tmux | ~/.tmux.conf | Home | Terminal multiplexer |
| zsh | ~/.zshrc + ~/.config/zsh/ | Mixed | Shell configuration |

## Naming Conventions
| Type | Convention | Example |
|------|-----------|---------|
| Package names | tool-name | nvim, starship, tmux |
| Config files | tool conventions | .zshrc, starship.toml, init.lua |
| Directory structure | XDG standard | .config/tool-name/ |
| Scripts/utilities | descriptive | install.sh, setup.sh |

## Configuration Standards
- Not commit sensitive or PII data
- Have configs be readable and if helpful comments can be used in files that support them if improves readability
- Be sure to follow the package/tools config schema
- If package/tool is on multiple systems, make sure configurations support Arch Linux and MacOS

## Security and Deployment Requirements
- Ask for approval when performing stow when making sure config should work
- Do not perform any git actions to stage, commit, etc. for this dotfiles project

## Documentation Freshness Policy
**CRITICAL**: Configuration tools and best practices evolve rapidly. Always prioritize current documentation.

**Documentation Age Guidelines**:
- ⚠️ **2021 and older**: Consider OUTDATED - verify against current sources
- ✅ **2022+**: Generally reliable but validate major changes
- 🔥 **Current year**: Preferred sources

**When researching external tools**:
1. **Always check official documentation first** (tool's official site/GitHub)
2. **Verify version compatibility** with current Arch Linux / MacOS packages
3. **Use ExternalScout** to fetch latest documentation for unfamiliar tools
4. **Cross-reference multiple sources** when configuration patterns seem outdated
5. **Test in dry-run/safe mode** before applying to live system

**Red Flags** (indicates potentially outdated info):
- References to deprecated config formats
- Installation methods that no longer work
- Configuration keys that have been renamed/removed
- Platform-specific paths that have changed

**Examples of rapidly evolving tools requiring fresh docs**:
- Neovim ecosystem (plugins, LSP configs, new features)
- Terminal emulators (Ghostty, Wezterm, Kitty feature updates)  
- Package managers (Homebrew, pacman, nix changes)
- Shell configurations (zsh, fish new features)

## Directory Structure Clarification
**GLOBAL OpenCode Configuration** (stow package):
- `/home/jordan/dotfiles/opencode/.config/opencode/` 
- This gets stowed to `~/.config/opencode/` (system-wide OpenCode config)
- Contains global context, agents, commands, skills

**PROJECT-SPECIFIC Configuration** (for this dotfiles project):
- `/home/jordan/dotfiles/.opencode/` 
- Contains project intelligence specific to THIS dotfiles repository
- Used by agents when working on dotfiles management tasks

## 📂 Codebase References
**Packages**: `/home/jordan/dotfiles/{nvim,starship,opencode,ghostty,tmux,zsh}/` - Individual tool configurations
**Config Structure**: `.config/` subdirectories for XDG-compliant tools
**Deployment**: GNU Stow from `/home/jordan/dotfiles/` root directory
**Project Context**: `/home/jordan/dotfiles/.opencode/` - Project-specific OpenCode configuration
**Global Context**: `/home/jordan/dotfiles/opencode/.config/opencode/` - Global OpenCode configuration (stow package)

## Cross-Platform Notes
- **Arch Linux**: Primary development environment
- **MacOS**: Secondary support target
- **Considerations**: Path differences, package manager variations, tool availability

## Related Files
- Business Domain: project-intelligence/business-domain.md (future)
- Tool Documentation: Individual package README files
- Installation Guide: install.sh scripts per package