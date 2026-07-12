-- Modules
require('vim._core.ui2').enable()
require("config.options")
require("config.commands")
require("config.autocommands")
require("config.lsp")
require("config.keymaps")

-- File types
vim.filetype.add({
    extension = { v = "systemverilog" }
})

-- Lazy-nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
