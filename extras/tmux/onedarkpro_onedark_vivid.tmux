# Original layout from https://github.com/folke/tokyonight.nvim

set -g mode-style "fg=#89ca78,bg=#3d434f"

set -g message-style "fg=#89ca78,bg=#3d434f"
set -g message-command-style "fg=#89ca78,bg=#3d434f"

set -g pane-border-style "fg=#3d434f"
set -g pane-active-border-style "fg=#89ca78"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#89ca78,bg=#22252c"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#282c34,bg=#89ca78,bold] #S #[fg=#89ca78,bg=#22252c,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#22252c,bg=#22252c,nobold,nounderscore,noitalics]#[fg=#89ca78,bg=#22252c] #{prefix_highlight} #[fg=#3d434f,bg=#22252c,bold,nounderscore,noitalics]#[fg=#89ca78,bg=#3d434f] %Y-%m-%d  %I:%M %p #[fg=#89ca78,bg=#3d434f,nobold,nounderscore,noitalics]#[fg=#282c34,bg=#89ca78,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#22252c,bg=#22252c,nobold,nounderscore,noitalics]#[fg=#89ca78,bg=#22252c] #{prefix_highlight} #[fg=#3d434f,bg=#22252c,bold,nounderscore,noitalics]#[fg=#89ca78,bg=#3d434f] %Y-%m-%d  %H:%M #[fg=#89ca78,bg=#3d434f,nobold,nounderscore,noitalics]#[fg=#282c34,bg=#89ca78,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#89ca78,bg=#22252c"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#89ca78,bg=#22252c"
setw -g window-status-format "#[fg=#22252c,bg=#22252c,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#22252c,bg=#22252c,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#22252c,bg=#3d434f,nobold,nounderscore,noitalics]#[fg=#89ca78,bg=#3d434f,bold] #I  #W #F #[fg=#3d434f,bg=#22252c,nobold,nounderscore,noitalics]"

# Requires tmux-plugins/tmux-prefix-highlight
set -g @prefix_highlight_output_prefix "#[fg=#61afef]#[bg=#22252c]#[fg=#22252c]#[bg=#61afef]"
set -g @prefix_highlight_output_suffix ""
