local M = {}

M.template = [[
[colors]
ansi = [
  "${black}",
  "${red}",
  "${green}",
  "${yellow}",
  "${blue}",
  "${purple}",
  "${cyan}",
  "${white}",
]
background = "${bg}"
brights = [
  "${gray}",
  "${bright_red}",
  "${bright_green}",
  "${bright_yellow}",
  "${bright_blue}",
  "${bright_purple}",
  "${bright_cyan}",
  "${bright_white}",
]
cursor_bg = "${purple}"
cursor_fg = "${bg}"
foreground = "${fg}"
selection_bg = "${purple}"
selection_fg = "${fg}"

[colors.tab_bar]
inactive_tab_edge = "${bg}"
background = "${bg}"

[colors.tab_bar.active_tab]
fg_color = "${purple}"
bg_color = "${bg}"
intensity = "Bold"

[colors.tab_bar.inactive_tab]
fg_color = "${gray}"
bg_color = "${bg}"
intensity = "Bold"

[colors.tab_bar.inactive_tab_hover]
fg_color = "${purple}"
bg_color = "${bg}"

[colors.tab_bar.new_tab]
fg_color = "${purple}"
bg_color = "${bg}"

[colors.tab_bar.new_tab_hover]
fg_color = "${bg}"
bg_color = "${purple}"

[colors.indexed]
59 = "${gray}"
100 = "${highlight}"
214 = "${orange}"

[metadata]
name = "onedarkpro_${name}"
origin_url = "https://github.com/olimorris/onedarkpro.nvim"
]]

return M
