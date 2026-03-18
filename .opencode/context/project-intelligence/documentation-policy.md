<!-- Context: project-intelligence/documentation-policy | Priority: high | Version: 1.0 | Updated: 2026-03-18 -->

# Documentation Freshness Policy

**Purpose**: Ensure agents always use current, accurate documentation for dotfiles configuration tools.
**Last Updated**: 2026-03-18

## Core Principle

**Configuration tools evolve rapidly**. Dotfiles practices from 2021 may be completely obsolete by 2026.

## Age-Based Guidelines

| Age | Status | Action Required |
|-----|--------|-----------------|
| **2021 and older** | ⚠️ OUTDATED | Always verify against current sources |
| **2022-2023** | 🔍 VALIDATE | Check for major changes, deprecated features |
| **2024+** | ✅ RELIABLE | Generally current, but verify for recent tools |
| **Current year** | 🔥 PREFERRED | Use these sources first |

## Mandatory Verification Process

**Before implementing any external configuration advice**:

1. **Check Official Sources First**
   - Tool's official documentation website
   - GitHub repository README and wiki
   - Official configuration examples

2. **Use ExternalScout for Unknown Tools**
   ```
   task(
     subagent_type="ExternalScout", 
     description="Get current {tool} config patterns",
     prompt="Fetch current documentation for {tool}: {specific question}"
   )
   ```

3. **Verify Version Compatibility**
   - Check Arch Linux current package version: `pacman -Si {package}`
   - Check Homebrew current version: `brew info {package}`
   - Ensure config examples match your installed version

4. **Cross-Reference Multiple Sources**
   - Official docs + community examples + recent tutorials
   - Look for consensus on current best practices
   - Identify deprecated vs. current patterns

5. **Test Safely First**
   - Use `stow -n` (dry-run) to preview changes
   - Backup existing configs before changes
   - Test on non-critical systems first

## Red Flags: Outdated Documentation

**Immediate warning signs**:
- ❌ References to config formats no longer supported
- ❌ Installation instructions that fail on current systems  
- ❌ Configuration keys that have been renamed/deprecated
- ❌ Platform paths that have changed (e.g., old XDG paths)
- ❌ Plugin/extension names that have been renamed
- ❌ Package manager commands that have changed syntax

## Tool-Specific Considerations

### Rapidly Evolving (High Risk of Outdated Info)
- **Neovim**: LSP configs, plugin managers, new features every release
- **Terminal Emulators**: Ghostty (very new), Wezterm, Kitty frequent updates
- **Shell Configs**: zsh/fish new features, prompt themes
- **Package Managers**: Homebrew formula changes, pacman updates
- **Development Tools**: Node.js/npm, language toolchains

### Neovim + AstroNvim Specific Guidelines

**Documentation Priority Order** (prefer higher priority):
1. **AstroNvim Documentation** (PREFERRED for config patterns)
   - https://docs.astronvim.com/
   - https://github.com/AstroNvim/astrocommunity
2. **Neovim Official Documentation** (for core functionality)
   - https://neovim.io/doc/user/
   - https://neovim.io/doc/user/vimindex/
   - https://neovim.io/doc/user/quickref/

**When to Use Which**:
- **Configuration patterns, plugin setup, UI customization**: Use AstroNvim docs first
- **Core Neovim features, API, built-in functionality**: Use Neovim official docs
- **If both cover the same topic**: Prefer AstroNvim approach to maintain consistency

**AstroNvim-Specific Considerations**:
- **Template-based configuration**: Follow AstroNvim's user configuration patterns
- **Plugin management**: Use AstroNvim's plugin architecture (lazy.nvim integration)
- **LSP configuration**: Prefer AstroNvim's LSP setup methods
- **UI/theme customization**: Use AstroNvim's customization patterns
- **Community plugins**: Check AstroNvim Community repository first

**ExternalScout Usage for Neovim**:
```
task(
  subagent_type="ExternalScout",
  description="Get AstroNvim config patterns",
  prompt="Fetch current documentation for AstroNvim: [specific configuration need]
  
  Sources to prioritize:
  - https://docs.astronvim.com/
  - https://github.com/AstroNvim/astrocommunity
  
  Focus on: [plugin setup/LSP config/UI customization/etc.]
  
  Context: Working with existing AstroNvim configuration"
)

### More Stable (Lower Risk)
- **GNU Stow**: Core functionality rarely changes
- **Basic Shell**: bash/zsh core features stable
- **XDG Standards**: Established directory conventions
- **Git**: Core configuration stable

## Implementation in Practice

**When an agent encounters external documentation**:

1. **Check publication date immediately**
2. **If 2021 or older**: 
   - Flag as potentially outdated
   - Use ExternalScout to get current documentation
   - Mention age concern to user before proceeding

3. **If no date available**:
   - Assume potentially outdated
   - Verify through official sources
   - Use ExternalScout for current information

## Examples

### ❌ Outdated Pattern (2021)
```bash
# Old Neovim package manager
call plug#begin('~/.vim/plugged')  # Vim-Plug era
```

### ✅ Current Pattern (2024+)
```lua
-- Modern lazy.nvim package manager (AstroNvim approach)
require("lazy").setup({
  spec = { import = "plugins" }
})
```

### ❌ Generic Neovim Config
```lua
-- Generic LSP setup (not AstroNvim pattern)
require('lspconfig').rust_analyzer.setup{}
```

### ✅ AstroNvim Config Pattern
```lua
-- AstroNvim LSP configuration approach
return {
  "AstroNvim/astrolsp",
  opts = {
    config = {
      rust_analyzer = {
        -- AstroNvim-specific LSP configuration
      }
    }
  }
}
```

### ❌ Outdated Stow Usage
```bash
stow --target=$HOME dotfiles  # Old syntax, deprecated flags
```

### ✅ Current Stow Usage  
```bash
cd ~/dotfiles && stow package-name/  # Current recommended approach
```

## Agent Instructions

**When working on dotfiles tasks**:

1. **Always prioritize ExternalScout** for tool-specific questions
2. **Flag documentation age** when you encounter external references
3. **Mention to user** if information seems potentially outdated
4. **Test safely** with dry-run options when available
5. **Backup first** before making configuration changes

## Related Context Files
- **technical-domain.md**: Overall configuration patterns and standards
- **ExternalScout skill**: For fetching current documentation
- **GNU Stow documentation**: In .tmp/external-context/ (if fetched)