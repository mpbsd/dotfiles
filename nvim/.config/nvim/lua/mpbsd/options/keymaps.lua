vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>;", ":", { noremap = true, silent = false })

vim.keymap.set("n", "<leader>rw", ":Ex<CR>", { noremap = true, silent = true })

-- config files
vim.keymap.set("n", "<leader>erc", ":e ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>eop", ":e ~/.config/nvim/lua/mpbsd/options/options.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ekm", ":e ~/.config/nvim/lua/mpbsd/options/keymaps.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>eau", ":e ~/.config/nvim/lua/mpbsd/options/autocmd.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>egl", ":e ~/.config/nvim/lua/mpbsd/options/globals.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>epg", ":e ~/.config/nvim/lua/mpbsd/plugins<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>els", ":e ~/.config/nvim/lua/mpbsd/luasnip<CR>", { noremap = true, silent = true })
