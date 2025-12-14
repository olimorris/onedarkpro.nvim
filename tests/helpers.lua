local Helpers = {}

Helpers.child_start = function(child)
    child.restart({ "-u", "scripts/minimal_init.lua" })
    child.o.statusline = ""
    child.o.laststatus = 0
    child.o.cmdheight = 0
end

return Helpers
