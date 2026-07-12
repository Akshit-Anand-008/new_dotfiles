return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
        local ls = require "luasnip"
        require("luasnip.loaders.from_lua").lazy_load({
            paths = { "~/.config/nvim/lua/snippets" }
        })
        -- ls.filetype_extend("vimwiki", { "markdown" })

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.expand_or_jumpable() then ls.expand_or_jump() end
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-d>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
    end
}
