local M = {}

M.themes = {
    "onedark",
    "onelight",
    "onedark_dark",
    "onedark_vivid",
}

---Return the color table for one of the two themes
---@param name string
---@return table
function M.get_theme_colors(name)
    name = name or require("onedarkpro.config").config.theme

    if type(name) == "function" then
        name = name()
    end

    if vim.tbl_contains(M.themes, name) then
        return require("onedarkpro.colors." .. name).load()
    end

    -- NOTE: This file is loaded many times if the user calls the get_colors method
    vim.cmd(
        "echohl WarningMsg | echom \"OneDarkPro.nvim: Could not find theme '"
            .. name
            .. "'. Loading onedark instead\" | echohl NONE"
    )
    return require("onedarkpro.colors.onedark").load()
end

return M
