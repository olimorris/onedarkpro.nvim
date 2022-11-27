local util = require("plenary.async.util")
local async = require("plenary.async.tests")

local tbl = {}
local hash = nil

describe("Using the cache", function()
    before_each(function()
        tbl = {
            colors = {},
            highlights = {},
            filetypes = {
                javascript = true,
                lua = true,
                markdown = true,
                php = true,
                python = true,
                ruby = true,
                rust = true,
                toml = true,
                typescript = true,
                typescriptreact = true,
                vue = true,
                yaml = true,
            },
        }
        hash = require("onedarkpro.lib.hash").generate(tbl)
    end)

    it("deep tables should always return the SAME hash value", function()
        assert.equals(423509938, hash)
    end)

    it("deep tables should always return a DIFFERENT hash value", function()
        tbl.colors = {
            red = "#ff0000",
        }
        assert.not_equals(hash, require("onedarkpro.lib.hash").generate(tbl))
    end)

    -- it("the hash should stay the same if the config doesn't change", function()
    --     -- util.scheduler()
    --     -- print(require("onedarkpro.lib.hash").generate("COOL"))
    --     assert.equals(hash, require("onedarkpro.config").hash())
    -- end)
end)
