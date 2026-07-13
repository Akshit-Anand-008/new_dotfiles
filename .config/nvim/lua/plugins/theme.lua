require("nightfox").setup({
    palettes = { carbonfox = { bg1 = "#000000" } },
    groups = { all = { CursorLine = { bg = "#121212" } } },
})
vim.cmd.colorscheme("carbonfox")

-- {
--     "folke/tokyonight.nvim",
--     opts = { style = "night" },
--     init = function() vim.cmd.colorscheme("tokyonight") end,
-- },

-- {
--     "ellisonleao/gruvbox.nvim",
--     init = function() vim.cmd.colorscheme("gruvbox") end
-- },

-- {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     opts = { flavour = "mocha" },
--     init = function() vim.cmd.colorscheme("catppuccin") end,
-- },
