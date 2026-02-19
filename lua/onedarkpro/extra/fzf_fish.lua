local M = {}

function M.generate(colors)
  local fzf = require("onedarkpro.extra.fzf")
  local fzf_colors = fzf.get_fzf_colors(colors)
  local ret = {}

  for _, entry in ipairs(fzf_colors) do
    local line = string.format("--color=%s:%s", entry.key, entry.color)
    if entry.modifier then
      line = line .. ":" .. entry.modifier
    end
    ret[#ret + 1] = string.format("set -a FZF_DEFAULT_OPTS %s", line)
  end

  return table.concat(ret, "\n")
end

return M
