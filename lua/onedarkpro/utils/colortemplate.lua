local M = {}

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
]]

--- Pre process the color table before rendering the template (useful for adding new colors like the bright colors)
---@param colorTable table color table to process
---@return table color table with the new colors
function M.preRender(colorTable)
    return colorTable
end

---Render the template
---return string The rendered template
function M.render()
    local colors = require("onedarkpro.helpers").get_colors()
    colors = M.preRender(colors)
    local renderedTemplate = M.template

    for color, hex in pairs(colors) do
        renderedTemplate = string.gsub(renderedTemplate, "{" .. color .. "}", tostring(hex))
    end

    return renderedTemplate
end

---Open the rendered template into a new buffer
---@param bufferName string Name of the new buffer
function M.showInNewBuffer(bufferName)
    local buf = vim.api.nvim_create_buf(true, true)
    local renderedTemplate = M.render()

    local i = 0
    for line in renderedTemplate:gmatch("([^\n]*)\n?") do
        vim.api.nvim_buf_set_lines(buf, i, (i + 1), false, { line })
        i = i + 1
    end

    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "filetype", "Onedarkpro")
    vim.api.nvim_buf_set_name(buf, bufferName)
    vim.api.nvim_win_set_buf(0, buf)
end

return M
