return {
    {
        cmd = "OneDarkProCache",
        callback = function()
            require("onedarkpro").cache()
        end,
        opts = {
            desc = "Cache the OneDarkPro theme",
            range = false,
        },
    },
    {
        cmd = "OneDarkProClean",
        callback = function()
            require("onedarkpro").clean()
        end,
        opts = {
            desc = "Clean up the theme's cache",
            range = false,
        },
    },
    {
        cmd = "OneDarkProColors",
        callback = function()
            require("onedarkpro.utils.colorizer").show()
        end,
        opts = {
            desc = "Output the colors from the theme",
            range = false,
        },
    },
    {
        cmd = "OneDarkProExtras",
        callback = function()
            require("onedarkpro.extra").setup({ user_config = true })
        end,
        opts = {
            desc = "Export the extra themes based on a user's config",
            range = false,
        },
    },
}
