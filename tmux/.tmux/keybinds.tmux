#!/usr/bin/env bash

# Reload config
unbind r
bind r source-file ~/.tmux.conf \; display "♻️ Reloaded tmux config"

# Lazygit popup
bind C-y display-popup \
  -d "#{pane_current_path}" \
  -w 80% \
  -h 80% \
  -E "lazygit"

# Vertical split with opencode
bind C-o split-window \
  -h \
  -l 30% \
  -c "#{pane_current_path}" \
  "opencode"
