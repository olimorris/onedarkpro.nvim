local util = require("onedarkpro.utils")
local cache_path, _ = require("onedarkpro.config").get_cached_info()

local tbl = {}
local hash = nil

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("it SHOULD NOT regenerate a fingerprint if it doesn't need to", function()
        assert.equals(vim.g.fingerprint, util.hash(util.join_paths(cache_path, "fingerprint")))
    end)
    it("it SHOULD NOT regenerate a user_config_hash if it doesn't need to", function()
        assert.equals(vim.g.user_config_hash, util.hash(util.join_paths(cache_path, "user_config_hash")))
    end)
    it("it SHOULD NOT regenerate colorschemes if it doesn't need to", function()
        assert.equals(vim.g.onedark_compiled, util.hash(util.join_paths(cache_path, "onedark_compiled")))
        assert.equals(vim.g.onelight_compiled, util.hash(util.join_paths(cache_path, "onelight_compiled")))
    end)
end)

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
        hash = require("onedarkpro.lib.hash")(tbl)
    end)

    it("the SAME table should always return the SAME hash", function()
        assert.equals(-1727766954, hash)
    end)

    it("a MODIFIED table should return a DIFFERENT hash", function()
        tbl.colors = {
            red = "#ff0000",
        }
        assert.not_equals(hash, require("onedarkpro.lib.hash")(tbl))
    end)
end)
