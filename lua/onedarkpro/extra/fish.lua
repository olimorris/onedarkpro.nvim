-- Reference:
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_day.fish

local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
    local fish_colors = {}
    for k, v in pairs(colors) do
        if type(v) == "string" then fish_colors[k] = v:gsub("^#", "") end
    end

    return utils.replace_vars(
        [[
# Colors - https://github.com/olimorris/onedarkpro.nvim
set -l foreground ${fg}
set -l selection ${selection}
set -l comment ${gray}
set -l red ${red}
set -l orange ${orange}
set -l yellow ${yellow}
set -l green ${green}
set -l blue ${blue}
set -l purple ${purple}
set -l cyan ${cyan}

# Syntax highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $purple
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $yellow
set -g fish_color_error $red
set -g fish_color_param $blue
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $foreground
set -g fish_color_escape $purple
set -g fish_color_autosuggestion $comment
set -g fish_color_cwd $cyan
set -g fish_color_user $purple
set -g fish_color_host $orange
set -g fish_color_valid_path $green
set -g fish_color_prefix $blue
set -g fish_color_history_current_command $yellow
set -g fish_color_history_duration $comment
set -g fish_color_error_background --background=$red

 # Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
]],
        fish_colors
    )
end

return M
