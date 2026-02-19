local Notify = {}

local format = function(...)
  local args = { ... }

  -- The header for any notifications
  local msg = "[OneDarkPro]:\n"

  for _, v in ipairs(args[1]) do
    msg = msg .. tostring(v) .. "\n"
  end

  return msg
end

function Notify:info(...)
  vim.notify(format(...), vim.log.levels.INFO)
end
function Notify:warn(...)
  vim.notify(format(...), vim.log.levels.WARN)
end
function Notify:error(...)
  vim.notify(format(...), vim.log.levels.ERROR)
end

return Notify
