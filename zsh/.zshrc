# ~/.zshrc
# Entry point only — all real config lives in ~/.config/zsh/conf.d/
# Managed via ~/dotfiles, symlinked by GNU Stow

# Load all modular zsh config files in order
for file in "${HOME}/.config/zsh/conf.d"/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done

