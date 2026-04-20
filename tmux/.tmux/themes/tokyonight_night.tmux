#!/usr/bin/env bash

# TokyoNight colors for Tmux
# Source: https://github.com/folke/tokyonight.nvim/blob/main/extras/tmux/tokyonight_night.tmux

set -g mode-style "fg=#7aa2f7,bg=#3b4261"

set -g message-style "fg=#7aa2f7,bg=#3b4261"
set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#7aa2f7"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#7aa2f7,bg=#16161e"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#15161e,bg=#7aa2f7,bold] #S #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics] "
set -g status-right "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#16161e] #{prefix_highlight} #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d  #[fg=#bb9af7,bg=#3b4261,nobold,nounderscore,noitalics]  #[fg=#7aa2f7,bg=#3b4261]   %H:%M #[fg=##3b4261,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#15161e,bg=#7aa2f7,bold]󰉋 #{b:pane_current_path} #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics] "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#16161e] #{prefix_highlight} #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d  #[fg=#bb9af7,bg=#3b4261,nobold,nounderscore,noitalics]  #[fg=#7aa2f7,bg=#3b4261] %H:%M  #[fg=##3b4261,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#15161e,bg=#7aa2f7,bold]󰉋 #{b:pane_current_path} #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics] "
}

setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#a9b1d6,bg=#16161e"
setw -g window-status-format "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics] #[fg=#bb9af7,bg=#16161e] #I  #W #F #[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#16161e,bg=#3b4261,nobold,nounderscore,noitalics] #[fg=#73daca,bg=#3b4261,nobold,nounderscore,noitalics] #[fg=#7aa2f7,bg=#3b4261,bold] #W #F #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics] "

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#e0af68]#[bg=#16161e] #[fg=#16161e]#[bg=#e0af68]"
set -g @prefix_highlight_output_suffix " "
