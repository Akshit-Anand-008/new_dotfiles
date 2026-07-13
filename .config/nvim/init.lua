-- Modules
require('vim._core.ui2').enable()
require("config.options")
require("config.commands")
require("config.autocommands")
require("config.lsp")
require("config.keymaps")
require("plugins.vimpack")

-- File types
vim.filetype.add({
    extension = { v = "systemverilog" }
})
