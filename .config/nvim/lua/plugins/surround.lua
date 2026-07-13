vim.g.nvim_surround_no_mappings = true;
vim.keymap.set("n", "m", "<Plug>(nvim-surround-normal)")
vim.keymap.set("x", "m", "<Plug>(nvim-surround-visual)")
vim.keymap.set("n", "mm", "<Plug>(nvim-surround-normal-cur)")
vim.keymap.set("n", "dm", "<Plug>(nvim-surround-delete)")
vim.keymap.set("n", "cm", "<Plug>(nvim-surround-change)")
