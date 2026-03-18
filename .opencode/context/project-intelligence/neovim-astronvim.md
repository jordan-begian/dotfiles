<!-- Context: project-intelligence/neovim-astronvim | Priority: high | Version: 1.0 | Updated: 2026-03-18 -->

# Neovim + AstroNvim Configuration Guidelines

**Purpose**: Specific guidelines for maintaining Neovim configuration using AstroNvim template.
**Last Updated**: 2026-03-18

## Documentation Hierarchy

**When researching Neovim configuration topics, use this priority order:**

### 1. AstroNvim Documentation (PREFERRED)
- 🔥 **Primary**: https://docs.astronvim.com/
- 🔥 **Community Plugins**: https://github.com/AstroNvim/astrocommunity
- **Use for**: Configuration patterns, plugin setup, UI customization, LSP config

### 2. Neovim Official Documentation (Core Features)
- 📚 **User Manual**: https://neovim.io/doc/user/
- 📚 **Command Index**: https://neovim.io/doc/user/vimindex/
- 📚 **Quick Reference**: https://neovim.io/doc/user/quickref/
- **Use for**: Core Neovim functionality, built-in features, API reference

## Configuration Patterns

### ✅ AstroNvim Pattern (PREFERRED)
```lua
-- User configuration following AstroNvim structure
-- File: ~/.config/nvim/lua/plugins/example.lua
return {
  "plugin-name/plugin-repo",
  opts = {
    -- AstroNvim-style configuration
  },
  config = function(_, opts)
    require("plugin-name").setup(opts)
  end,
}
```

### ❌ Generic Neovim Pattern (AVOID)
```lua
-- Generic plugin setup (doesn't follow AstroNvim patterns)
require('plugin-name').setup({
  -- Direct plugin configuration
})
```

## Common Configuration Areas

### Plugin Management
- **Method**: AstroNvim's lazy.nvim integration
- **Location**: `~/.config/nvim/lua/plugins/`
- **Pattern**: Return table with plugin specification
- **Community**: Check AstroNvim Community first before custom plugins

### LSP Configuration
- **Method**: AstroNvim's astrolsp integration
- **Location**: `~/.config/nvim/lua/plugins/astrolsp.lua`
- **Pattern**: Use AstroNvim's LSP configuration structure
- **Docs**: https://docs.astronvim.com/configuration/lsp/

### UI/Theme Customization
- **Method**: AstroNvim's astroui integration
- **Location**: `~/.config/nvim/lua/plugins/astroui.lua`
- **Pattern**: Use AstroNvim's UI configuration structure
- **Docs**: https://docs.astronvim.com/configuration/ui/

### Keybindings
- **Method**: AstroNvim's astrocore integration
- **Location**: `~/.config/nvim/lua/plugins/astrocore.lua`
- **Pattern**: Use AstroNvim's mapping structure
- **Docs**: https://docs.astronvim.com/configuration/mappings/

## Current Package Structure
```
nvim/.config/nvim/
├── init.lua              # AstroNvim entry point
├── lua/
│   ├── community.lua     # AstroNvim community plugins
│   ├── polish.lua        # Final configuration polish
│   └── plugins/          # Custom plugin configurations
│       ├── astrocore.lua # Core AstroNvim settings
│       ├── astrolsp.lua  # LSP configuration
│       ├── astroui.lua   # UI customization
│       ├── mason.lua     # Package manager config
│       ├── neo-tree.lua  # File explorer
│       ├── none-ls.lua   # Formatting/linting
│       ├── treesitter.lua # Syntax highlighting
│       └── user.lua      # Custom user plugins
└── README.md
```

## ExternalScout Usage for Neovim

**For AstroNvim-specific questions**:
```
task(
  subagent_type="ExternalScout",
  description="Get AstroNvim [feature] configuration",
  prompt="Fetch current documentation for AstroNvim: [specific need]
  
  Sources to prioritize:
  - https://docs.astronvim.com/
  - https://github.com/AstroNvim/astrocommunity
  
  Focus on:
  - Configuration patterns that follow AstroNvim structure
  - Plugin integration methods
  - [Specific feature: LSP/UI/mappings/etc.]
  
  Context: Maintaining AstroNvim-based configuration in dotfiles"
)
```

**For core Neovim functionality**:
```
task(
  subagent_type="ExternalScout", 
  description="Get Neovim core [feature] documentation",
  prompt="Fetch current documentation for Neovim core functionality: [specific feature]
  
  Sources:
  - https://neovim.io/doc/user/
  - Official Neovim documentation
  
  Focus on: Built-in functionality, API, core features
  
  Context: Understanding underlying Neovim capabilities for AstroNvim config"
)
```

## Configuration Decision Rules

| Topic | Use AstroNvim Docs | Use Neovim Docs | Notes |
|-------|-------------------|-----------------|-------|
| Plugin installation | ✅ | ❌ | Follow AstroNvim patterns |
| LSP setup | ✅ | ❌ | Use astrolsp integration |
| Keybindings | ✅ | ❌ | Use astrocore mappings |
| UI/themes | ✅ | ❌ | Use astroui patterns |
| Core Vim features | ❌ | ✅ | Built-in functionality |
| API reference | ❌ | ✅ | Low-level programming |
| Troubleshooting | ✅ first, then ❌ | If AstroNvim docs insufficient |

## Red Flags for Outdated Neovim Info

**Immediate warnings**:
- References to vim-plug, pathogen, or other legacy package managers
- Vimscript configuration examples (prefer Lua for AstroNvim)
- Generic `require()` plugin setups that don't follow AstroNvim structure
- LSP configurations that don't use astrolsp
- Direct lazy.nvim setup (AstroNvim handles this)

## Stow Deployment Notes

**Package deployment**:
```bash
cd ~/dotfiles
stow nvim/  # Links ~/.config/nvim/ structure
```

**Configuration testing**:
```bash
# Test AstroNvim configuration
nvim --headless -c "checkhealth" -c "qa"  # Health check
nvim --headless -c "Lazy check" -c "qa"   # Plugin check
```

## Related Files
- **technical-domain.md**: Overall dotfiles configuration patterns
- **documentation-policy.md**: Documentation freshness guidelines
- **AstroNvim Community**: https://github.com/AstroNvim/astrocommunity