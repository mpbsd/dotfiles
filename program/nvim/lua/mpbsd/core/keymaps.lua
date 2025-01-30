local keybind = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, desc = desc })
end

keybind("n", "<Leader>;", ":", "Ex mode")

keybind("n", "<LocalLeader>w", "<Cmd>w<CR>", "[W]rite")
keybind("n", "<LocalLeader>q", "<Cmd>q<CR>", "[Q]uit")

keybind("n", "<Leader>wa", "<Cmd>wa<CR>", "[W]rite [A]ll")
keybind("n", "<Leader>qa", "<Cmd>qa<CR>", "[Q]uit [A]ll")

keybind("n", "<Leader>zz", "ZZ<CR>", "ZZ")
keybind("n", "<Leader>zq", "ZQ<CR>", "ZQ")

keybind("n", [[<Leader>s\]], "<Cmd>vs<CR>", "[S]plit |")
keybind("n", [[<Leader>s-]], "<Cmd>sp<CR>", "[S]plit -")

keybind("n", "<C-H>", "<C-W><C-H>", "Move cursor to the Win on the left")
keybind("n", "<C-J>", "<C-W><C-J>", "Move cursor to the Win below")
keybind("n", "<C-K>", "<C-W><C-K>", "Move cursor to the Win above")
keybind("n", "<C-L>", "<C-W><C-L>", "Move cursor to the Win on the right")

keybind("n", "<Leader>wth", "<C-W>t<C-W>H")
keybind("n", "<Leader>wtk", "<C-W>t<C-W>K")

keybind("i", "<LocalLeader>cc", "<esc>mmb~`ma", "[C]amel [C]ase")
keybind("i", "<LocalLeader>tu", "<esc>mmbgUiw`ma", "[T]o [U]pper case")
keybind("i", "<LocalLeader>tl", "<esc>mmbguiw`ma", "[T]o [L]ower case")

keybind("n", "<Leader>lz", "<Cmd>Lazy<CR>", "[L]a[Z]y")
keybind("n", "<Leader>ms", "<Cmd>Mason<CR>", "[M]a[S]y")

keybind("n", "<Leader>0g", "<Cmd>0G<CR>")

keybind("n", "<LocalLeader>ch", "<Cmd>checkhealth<CR>", "[C]heck [H]ealth")

keybind("n", "<LocalLeader>x", "<Cmd>so %<CR>", "E[x]ecute this file")
