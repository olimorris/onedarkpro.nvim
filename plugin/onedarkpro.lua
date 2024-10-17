if vim.g.loaded_onedarkpro then return end

local cmds = require("onedarkpro.commands")
for _, cmd in ipairs(cmds) do
    vim.api.nvim_create_user_command(cmd.cmd, cmd.callback, cmd.opts)
end

vim.g.loaded_onedarkpro = true
