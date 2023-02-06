local M = {}

local helpers = require("onedarkpro.helpers")

M.template = [[
Example of template :
  black                    = "{black}"
  blue                     = "{blue}"
  cyan                     = "{cyan}"
  gray                     = "{gray}"
  green                    = "{green}"
  orange                   = "{orange}"
  purple                   = "{purple}"
  red                      = "{red}"
  white                    = "{white}"
  yellow                   = "{yellow}"
  bright_black              = "{bright_black}"
  bright_blue               = "{bright_blue}"
  bright_cyan               = "{bright_cyan}"
  bright_gray               = "{bright_gray}"
  bright_green              = "{bright_green}"
  bright_orange             = "{bright_orange}"
  bright_purple             = "{bright_purple}"
  bright_red                = "{bright_red}"
  bright_white              = "{bright_white}"
  bright_yellow             = "{bright_yellow}"
]]

--- Pre process the color table before rendering the template (useful for adding new colors like the bright colors)
---@param colors table color table to process
---@return table color table with the new colors
function M.pre_render(colors)
    colors["bright_black"] = helpers.lighten("black", 10, vim.g.colors_name)
    colors["bright_blue"] = helpers.lighten("blue", 10, vim.g.colors_name)
    colors["bright_cyan"] = helpers.lighten("cyan", 10, vim.g.colors_name)
    colors["bright_gray"] = helpers.lighten("gray", 10, vim.g.colors_name)
    colors["bright_green"] = helpers.lighten("green", 10, vim.g.colors_name)
    colors["bright_orange"] = helpers.lighten("orange", 10, vim.g.colors_name)
    colors["bright_purple"] = helpers.lighten("purple", 10, vim.g.colors_name)
    colors["bright_red"] = helpers.lighten("red", 10, vim.g.colors_name)
    colors["bright_white"] = helpers.lighten("white", 10, vim.g.colors_name)
    colors["bright_yellow"] = helpers.lighten("yellow", 10, vim.g.colors_name)

    return colors
end

---Render the template
---return string The rendered template
function M.render()
    local colors = require("onedarkpro.helpers").get_colors()
    colors = M.pre_render(colors)
    local rendered_template = M.template

    for color, hex in pairs(colors) do
        rendered_template = string.gsub(rendered_template, "{" .. color .. "}", tostring(hex))
    end

    return rendered_template
end

---Open the rendered template into a new buffer
---@param buf_name string Name of the new buffer
function M.show_in_buffer(buf_name)
    local buf = vim.api.nvim_create_buf(true, true)
    local rendered_template = M.render()

    local i = 0
    for line in rendered_template:gmatch("([^\n]*)\n?") do
        vim.api.nvim_buf_set_lines(buf, i, (i + 1), false, { line })
        i = i + 1
    end

    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "filetype", "Onedarkpro")
    vim.api.nvim_buf_set_name(buf, buf_name)
    vim.api.nvim_win_set_buf(0, buf)
end

return M
