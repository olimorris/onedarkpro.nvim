# Original layout from https://github.com/folke/tokyonight.nvim

set -g mode-style "fg=#1da912,bg=#e1e1e1"

set -g message-style "fg=#1da912,bg=#e1e1e1"
set -g message-command-style "fg=#1da912,bg=#e1e1e1"

set -g pane-border-style "fg=#e1e1e1"
set -g pane-active-border-style "fg=#1da912"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#1da912,bg=#f3f3f3"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#fafafa,bg=#1da912,bold] #S #[fg=#1da912,bg=#f3f3f3,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#f3f3f3,bg=#f3f3f3,nobold,nounderscore,noitalics]#[fg=#1da912,bg=#f3f3f3] #{prefix_highlight} #[fg=#e1e1e1,bg=#f3f3f3,bold,nounderscore,noitalics]#[fg=#1da912,bg=#e1e1e1] %Y-%m-%d  %I:%M %p #[fg=#1da912,bg=#e1e1e1,nobold,nounderscore,noitalics]#[fg=#fafafa,bg=#1da912,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#f3f3f3,bg=#f3f3f3,nobold,nounderscore,noitalics]#[fg=#1da912,bg=#f3f3f3] #{prefix_highlight} #[fg=#e1e1e1,bg=#f3f3f3,bold,nounderscore,noitalics]#[fg=#1da912,bg=#e1e1e1] %Y-%m-%d  %H:%M #[fg=#1da912,bg=#e1e1e1,nobold,nounderscore,noitalics]#[fg=#fafafa,bg=#1da912,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#1da912,bg=#f3f3f3"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#1da912,bg=#f3f3f3"
setw -g window-status-format "#[fg=#f3f3f3,bg=#f3f3f3,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#f3f3f3,bg=#f3f3f3,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#f3f3f3,bg=#e1e1e1,nobold,nounderscore,noitalics]#[fg=#1da912,bg=#e1e1e1,bold] #I  #W #F #[fg=#e1e1e1,bg=#f3f3f3,nobold,nounderscore,noitalics]"

# Requires tmux-plugins/tmux-prefix-highlight
set -g @prefix_highlight_output_prefix "#[fg=#118dc3]#[bg=#f3f3f3]#[fg=#f3f3f3]#[bg=#118dc3]"
set -g @prefix_highlight_output_suffix ""
