local M = {}

-- Get FZF color options as a table from theme colors
-- Returns: { { key = "fg", color = "#abcdef", modifier = nil }, ... }
function M.get_fzf_colors(colors)
    local spec = {
        ["fg"] = { colors.fg },
        ["bg"] = { colors.bg },
        ["hl"] = { colors.purple },
        ["fg+"] = { colors.purple },
        ["bg+"] = { colors.cursorline },
        ["hl+"] = { colors.purple },
        ["info"] = { colors.cyan },
        ["border"] = { colors.gray },
        ["separator"] = { colors.gray },
        ["scrollbar"] = { colors.gray },
        ["gutter"] = { colors.bg },
        ["query"] = { colors.fg, "regular" },
        ["prompt"] = { colors.purple },
        ["pointer"] = { colors.purple },
        ["marker"] = { colors.purple },
        ["spinner"] = { colors.purple },
        ["header"] = { colors.blue },
    }

    local fzf_colors = {}

    for fzf_key, config in pairs(spec) do
        local color = config[1]
        local modifier = config[2]

        if color then
            fzf_colors[#fzf_colors + 1] = {
                key = fzf_key,
                color = color,
                modifier = modifier,
            }
        end
    end

    table.sort(fzf_colors, function(a, b)
        return a.key < b.key
    end)

    return fzf_colors
end

-- Generate FZF configuration for bash/zsh
function M.generate(colors)
    local fzf_colors = M.get_fzf_colors(colors)
    local ret = {}

    for _, entry in ipairs(fzf_colors) do
        local line = string.format("--color=%s:%s", entry.key, entry.color)
        if entry.modifier then line = line .. ":" .. entry.modifier end
        ret[#ret + 1] = "  " .. line .. " \\"
    end

    return string.format(
        [[export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        %s
"]],
        table.concat(ret, "\n")
    )
end

return M
