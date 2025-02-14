# Original layout from https://github.com/folke/tokyonight.nvim

set -g mode-style "fg=#89ca78,bg=#181818"

set -g message-style "fg=#89ca78,bg=#181818"
set -g message-command-style "fg=#89ca78,bg=#181818"

set -g pane-border-style "fg=#181818"
set -g pane-active-border-style "fg=#89ca78"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#89ca78,bg=#0e0e0e"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#000000,bg=#89ca78,bold] #S #[fg=#89ca78,bg=#0e0e0e,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#0e0e0e,bg=#0e0e0e,nobold,nounderscore,noitalics]#[fg=#89ca78,bg=#0e0e0e] #{prefix_highlight} #[fg=#181818,bg=#0e0e0e,bold,nounderscore,noitalics]#[fg=#89ca78,bg=#181818] %Y-%m-%d  %I:%M %p #[fg=#89ca78,bg=#181818,nobold,nounderscore,noitalics]#[fg=#000000,bg=#89ca78,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#0e0e0e,bg=#0e0e0e,nobold,nounderscore,noitalics]#[fg=#89ca78,bg=#0e0e0e] #{prefix_highlight} #[fg=#181818,bg=#0e0e0e,bold,nounderscore,noitalics]#[fg=#89ca78,bg=#181818] %Y-%m-%d  %H:%M #[fg=#89ca78,bg=#181818,nobold,nounderscore,noitalics]#[fg=#000000,bg=#89ca78,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#89ca78,bg=#0e0e0e"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#89ca78,bg=#0e0e0e"
setw -g window-status-format "#[fg=#0e0e0e,bg=#0e0e0e,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#0e0e0e,bg=#0e0e0e,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#0e0e0e,bg=#181818,nobold,nounderscore,noitalics]#[fg=#89ca78,bg=#181818,bold] #I  #W #F #[fg=#181818,bg=#0e0e0e,nobold,nounderscore,noitalics]"

# Requires tmux-plugins/tmux-prefix-highlight
set -g @prefix_highlight_output_prefix "#[fg=#61afef]#[bg=#0e0e0e]#[fg=#0e0e0e]#[bg=#61afef]"
set -g @prefix_highlight_output_suffix ""
