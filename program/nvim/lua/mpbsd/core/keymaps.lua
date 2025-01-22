local keybind = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, desc = desc })
end

keybind("n", "<localleader>w", ":w<CR>", "[W]rite")
keybind("n", "<localleader>q", ":q<CR>", "[Q]uit")

keybind("n", "<leader>wa", ":wa<CR>", "[W]rite [A]ll")
keybind("n", "<leader>qa", ":qa<CR>", "[Q]uit [A]ll")

keybind("n", "<leader>zz", "ZZ<CR>", "ZZ")
keybind("n", "<leader>zq", "ZQ<CR>", "ZQ")

keybind("n", "<localleader>;", ":", "Ex mode")

keybind("n", [[<leader>s\]], ":vs<CR>", "[S]plit |")
keybind("n", [[<leader>s-]], ":sp<CR>", "[S]plit -")

keybind("n", "<leader>wth", "<C-W>t<C-W>H")
keybind("n", "<leader>wtk", "<C-W>t<C-W>K")

keybind("n", "<C-H>", "<C-W><C-H>", "Move cursor to the Win on the left")
keybind("n", "<C-J>", "<C-W><C-J>", "Move cursor to the Win below")
keybind("n", "<C-K>", "<C-W><C-K>", "Move cursor to the Win above")
keybind("n", "<C-L>", "<C-W><C-L>", "Move cursor to the Win on the right")

keybind("i", "<localleader>cc", "<esc>mmb~`ma", "[C]amel [C]ase")
keybind("i", "<localleader>tu", "<esc>mmbgUiw`ma", "[T]o [U]pper case")
keybind("i", "<localleader>tl", "<esc>mmbguiw`ma", "[T]o [L]ower case")

keybind("n", "<leader>lz", ":Lazy<CR>", "[L]a[Z]y")
keybind("n", "<leader>ms", ":Mason<CR>", "[M]a[S]y")

-- experimental

keybind("n", "<leader>0g", ":0G<CR>")

keybind("n", "<localleader>ch", ":checkhealth<CR>", "[C]heck [H]ealth")

keybind("n", "<localleader>x", ":so %<CR>", "E[x]ecute this file")

keybind("n", "<localleader>pg", ":InspectTree<CR>", "[P]lay[G]round")

keybind("t", "<esc><esc>", [[<C-\><C-N>]], "Normal mode from Terminal-mode")
