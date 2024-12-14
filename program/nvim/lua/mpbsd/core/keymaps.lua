vim.keymap.set("n", "<leader><leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>q", ":q<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>s\\", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s-", ":split<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>wth", "<C-w>t<C-w>H", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wtk", "<C-w>t<C-w>K", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>0g", ":0G<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>lv", ":Lazy<CR>", { noremap = true, silent = true })
