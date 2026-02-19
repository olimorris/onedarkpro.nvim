# Original layout from https://github.com/folke/tokyonight.nvim

set -g mode-style "fg=#75BE78,bg=#353853"

set -g message-style "fg=#75BE78,bg=#353853"
set -g message-command-style "fg=#75BE78,bg=#353853"

set -g pane-border-style "fg=#353853"
set -g pane-active-border-style "fg=#75BE78"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#75BE78,bg=#1d1f2d"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#222435,bg=#75BE78,bold] #S #[fg=#75BE78,bg=#1d1f2d,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#1d1f2d,bg=#1d1f2d,nobold,nounderscore,noitalics]#[fg=#75BE78,bg=#1d1f2d] #{prefix_highlight} #[fg=#353853,bg=#1d1f2d,bold,nounderscore,noitalics]#[fg=#75BE78,bg=#353853] %Y-%m-%d  %I:%M %p #[fg=#75BE78,bg=#353853,nobold,nounderscore,noitalics]#[fg=#222435,bg=#75BE78,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#1d1f2d,bg=#1d1f2d,nobold,nounderscore,noitalics]#[fg=#75BE78,bg=#1d1f2d] #{prefix_highlight} #[fg=#353853,bg=#1d1f2d,bold,nounderscore,noitalics]#[fg=#75BE78,bg=#353853] %Y-%m-%d  %H:%M #[fg=#75BE78,bg=#353853,nobold,nounderscore,noitalics]#[fg=#222435,bg=#75BE78,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#75BE78,bg=#1d1f2d"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#75BE78,bg=#1d1f2d"
setw -g window-status-format "#[fg=#1d1f2d,bg=#1d1f2d,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1d1f2d,bg=#1d1f2d,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1d1f2d,bg=#353853,nobold,nounderscore,noitalics]#[fg=#75BE78,bg=#353853,bold] #I  #W #F #[fg=#353853,bg=#1d1f2d,nobold,nounderscore,noitalics]"

# Requires tmux-plugins/tmux-prefix-highlight
set -g @prefix_highlight_output_prefix "#[fg=#25ABE4]#[bg=#1d1f2d]#[fg=#1d1f2d]#[bg=#25ABE4]"
set -g @prefix_highlight_output_suffix ""
