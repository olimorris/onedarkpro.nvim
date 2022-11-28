local util = require("plenary.async.util")
local async = require("plenary.async.tests")

local tbl = {}
local hash = nil

describe("Using the cache", function()
    before_each(function()
        require("onedarkpro").clean()
        tbl = {
            colors = {},
            highlights = {},
            filetypes = {
                vue = true,
                javascript = true,
                lua = true,
                python = true,
                ruby = true,
                markdown = true,
                typescriptreact = true,
                rust = true,
                toml = true,
                php = true,
                typescript = true,
                yaml = true,
            },
        }
        require("onedarkpro.lib.hash").hash(tbl)
        hash = require("onedarkpro.lib.hash").hash(tbl)
    end)

    it("the SAME table should always return the SAME hash", function()
        assert.equals(1031236655, hash)
    end)

    it("a MODIFIED table should return a DIFFERENT hash", function()
        tbl.colors = {
            red = "#ff0000",
        }
        require("onedarkpro.lib.hash").hash(tbl)
        require("onedarkpro.lib.hash").hash(tbl)
        assert.not_equals(hash, require("onedarkpro.lib.hash").hash(tbl))
    end)

    -- it("the hash should stay the same if the config doesn't change", function()
    --     -- util.scheduler()
    --     -- print(require("onedarkpro.lib.hash").generate("COOL"))
    --     assert.equals(hash, require("onedarkpro.config").hash())
    -- end)
end)
