local file = require("onedarkpro.utils.file")
local cache_path, _ = require("onedarkpro.config").get_cached_info()

local tbl = {}
local hash = nil

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("it should not regenerate a fingerprint if it doesn't need to", function()
        assert.equals(vim.g.fingerprint, file.hash(file.join_paths(cache_path, "fingerprint")))
    end)
    it("it should not regenerate a user_config_hash if it doesn't need to", function()
        assert.equals(vim.g.user_config_hash, file.hash(file.join_paths(cache_path, "user_config_hash")))
    end)
    it("it should not regenerate colorschemes if it doesn't need to", function()
        assert.equals(vim.g.onedark_compiled, file.hash(file.join_paths(cache_path, "onedark_compiled")))
        assert.equals(vim.g.onelight_compiled, file.hash(file.join_paths(cache_path, "onelight_compiled")))
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
end)
