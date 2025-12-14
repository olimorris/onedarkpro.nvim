local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
  return utils.replace_vars(
    [[
# Original layout from https://github.com/folke/tokyonight.nvim

set -g mode-style "fg=${green},bg=${fg_gutter}"

set -g message-style "fg=${green},bg=${fg_gutter}"
set -g message-command-style "fg=${green},bg=${fg_gutter}"

set -g pane-border-style "fg=${fg_gutter}"
set -g pane-active-border-style "fg=${green}"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=${green},bg=${bg_statusline}"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=${bg},bg=${green},bold] #S #[fg=${green},bg=${bg_statusline},nobold,nounderscore,noitalics]"
set -g status-right "#[fg=${bg_statusline},bg=${bg_statusline},nobold,nounderscore,noitalics]#[fg=${green},bg=${bg_statusline}] #{prefix_highlight} #[fg=${fg_gutter},bg=${bg_statusline},bold,nounderscore,noitalics]#[fg=${green},bg=${fg_gutter}] %Y-%m-%d  %I:%M %p #[fg=${green},bg=${fg_gutter},nobold,nounderscore,noitalics]#[fg=${bg},bg=${green},bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=${bg_statusline},bg=${bg_statusline},nobold,nounderscore,noitalics]#[fg=${green},bg=${bg_statusline}] #{prefix_highlight} #[fg=${fg_gutter},bg=${bg_statusline},bold,nounderscore,noitalics]#[fg=${green},bg=${fg_gutter}] %Y-%m-%d  %H:%M #[fg=${green},bg=${fg_gutter},nobold,nounderscore,noitalics]#[fg=${bg},bg=${green},bold] #h "
}

setw -g window-status-activity-style "underscore,fg=${green},bg=${bg_statusline}"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=${green},bg=${bg_statusline}"
setw -g window-status-format "#[fg=${bg_statusline},bg=${bg_statusline},nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=${bg_statusline},bg=${bg_statusline},nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=${bg_statusline},bg=${fg_gutter},nobold,nounderscore,noitalics]#[fg=${green},bg=${fg_gutter},bold] #I  #W #F #[fg=${fg_gutter},bg=${bg_statusline},nobold,nounderscore,noitalics]"

# Requires tmux-plugins/tmux-prefix-highlight
set -g @prefix_highlight_output_prefix "#[fg=${blue}]#[bg=${bg_statusline}]#[fg=${bg_statusline}]#[bg=${blue}]"
set -g @prefix_highlight_output_suffix ""
]],
    colors
  )
end

return M
