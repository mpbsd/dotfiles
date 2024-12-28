local keybind = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

keybind("n", "<leader><leader>w", ":w<CR>", "[W]rite")
keybind("n", "<leader><leader>q", ":q<CR>", "[Q]uit")

vim.keymap.set("i", "<localleader>cc", "<esc>mmb~`ma", { noremap = true, silent = true })
vim.keymap.set("i", "<localleader>tu", "<esc>mmbgUiw`ma", { noremap = true, silent = true })
vim.keymap.set("i", "<localleader>tl", "<esc>mmbguiw`ma", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>s\\", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s-", ":split<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>wth", "<C-w>t<C-w>H", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wtk", "<C-w>t<C-w>K", { noremap = true, silent = true })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-N>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><leader>x", ":source %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>0g", ":0G<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>lv", ":Lazy<CR>", { noremap = true, silent = true })

-- experimental

vim.keymap.set("n", "<leader>vfc", function()
	vim.cmd([[%s/), (/),\r\t(/g]])
	vim.cmd([[%s/\[(/\[\r\t(/]])
	vim.cmd([[%s/)\]/)\r\],/]])
end, { noremap = true, silent = true })
