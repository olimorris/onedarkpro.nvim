lua << EOF
--[[
    Leaving this file in as legacy to prevent people having to change their config
    after we renamed from onedark to onedarkpro
]]
print("Please reference `onedarkpro` instead of `onedark` when initialising the theme. This will be removed in the next update")
require("onedarkpro").load()
EOF