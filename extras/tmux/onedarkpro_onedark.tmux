# Original layout from https://github.com/folke/tokyonight.nvim

set -g mode-style "fg=#98c379,bg=#3d4350"

set -g message-style "fg=#98c379,bg=#3d4350"
set -g message-command-style "fg=#98c379,bg=#3d4350"

set -g pane-border-style "fg=#3d4350"
set -g pane-active-border-style "fg=#98c379"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#98c379,bg=#22262d"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#282c34,bg=#98c379,bold] #S #[fg=#98c379,bg=#22262d,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#22262d,bg=#22262d,nobold,nounderscore,noitalics]#[fg=#98c379,bg=#22262d] #{prefix_highlight} #[fg=#3d4350,bg=#22262d,bold,nounderscore,noitalics]#[fg=#98c379,bg=#3d4350] %Y-%m-%d  %I:%M %p #[fg=#98c379,bg=#3d4350,nobold,nounderscore,noitalics]#[fg=#282c34,bg=#98c379,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#22262d,bg=#22262d,nobold,nounderscore,noitalics]#[fg=#98c379,bg=#22262d] #{prefix_highlight} #[fg=#3d4350,bg=#22262d,bold,nounderscore,noitalics]#[fg=#98c379,bg=#3d4350] %Y-%m-%d  %H:%M #[fg=#98c379,bg=#3d4350,nobold,nounderscore,noitalics]#[fg=#282c34,bg=#98c379,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#98c379,bg=#22262d"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#98c379,bg=#22262d"
setw -g window-status-format "#[fg=#22262d,bg=#22262d,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#22262d,bg=#22262d,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#22262d,bg=#3d4350,nobold,nounderscore,noitalics]#[fg=#98c379,bg=#3d4350,bold] #I  #W #F #[fg=#3d4350,bg=#22262d,nobold,nounderscore,noitalics]"

# Requires tmux-plugins/tmux-prefix-highlight
set -g @prefix_highlight_output_prefix "#[fg=#61afef]#[bg=#22262d]#[fg=#22262d]#[bg=#61afef]"
set -g @prefix_highlight_output_suffix ""
