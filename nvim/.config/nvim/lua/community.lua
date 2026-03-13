-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.completion.copilot-vim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.split-and-window.neominimap-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  -- import/override with your plugins folder
}
