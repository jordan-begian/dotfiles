<!-- Context: project-intelligence/navigation | Priority: high | Version: 1.0 | Updated: 2026-03-18 -->

# Project Intelligence Navigation

**Purpose**: Quick overview and navigation for dotfiles project intelligence.
**Last Updated**: 2026-03-18

## Quick Routes

| File | Description | Priority |
|------|-------------|----------|
| technical-domain.md | Configuration management & deployment patterns | critical |
| documentation-policy.md | Documentation freshness guidelines & verification process | high |
| neovim-astronvim.md | Neovim + AstroNvim specific configuration guidelines | high |

## Project Overview

**Type**: Personal dotfiles configuration repository
**Purpose**: Version-controlled tool configurations managed via GNU Stow
**Stack**: GNU Stow + XDG configs + Evolving tool set

## Key Context Files

### Current
- **technical-domain.md** - Configuration stack, stow patterns, deployment process
- **documentation-policy.md** - Documentation freshness guidelines (2021+ outdated policy)
- **neovim-astronvim.md** - Neovim + AstroNvim configuration patterns and documentation priority

### Planned
- **business-domain.md** - Personal productivity goals and tool selection rationale
- **decisions-log.md** - Configuration decisions and migration history
- **living-notes.md** - Active development notes and todo items

## Directory Structure Reference

```
/home/jordan/dotfiles/
├── .opencode/                    # PROJECT-SPECIFIC OpenCode config
│   └── context/
│       └── project-intelligence/ # This directory
└── opencode/                     # GLOBAL OpenCode config (stow package)
    └── .config/opencode/         # Gets stowed to ~/.config/opencode/
```