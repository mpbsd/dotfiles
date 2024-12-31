local keybinding = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, desc = desc })
end

keybinding("n", "<localleader>w", ":w<CR>", "[W]rite")
keybinding("n", "<localleader>q", ":q<CR>", "[Q]uit")

keybinding("n", "<leader>wa", ":wa<CR>", "[W]rite [A]ll")
keybinding("n", "<leader>qa", ":qa<CR>", "[Q]uit [A]ll")

keybinding("n", "<leader>zz", "ZZ<CR>", "ZZ")
keybinding("n", "<leader>zq", "ZQ<CR>", "ZQ")

keybinding("n", "<localleader>;", ":", "Ex mode")

keybinding("n", [[<leader>s\]], ":vs<CR>", "[S]plit Vertically")
keybinding("n", [[<leader>s-]], ":sp<CR>", "[S]plit Horizontally")

keybinding("n", "<leader>wth", "<C-W>t<C-W>H")
keybinding("n", "<leader>wtk", "<C-W>t<C-W>K")

keybinding("n", "<C-H>", "<C-W><C-H>", "Move cursor to the Win on the left")
keybinding("n", "<C-J>", "<C-W><C-J>", "Move cursor to the Win below")
keybinding("n", "<C-K>", "<C-W><C-K>", "Move cursor to the Win above")
keybinding("n", "<C-L>", "<C-W><C-L>", "Move cursor to the Win on the right")

keybinding("i", "<localleader>cc", "<esc>mmb~`ma", "[C]amel [C]ase")
keybinding("i", "<localleader>tu", "<esc>mmbgUiw`ma", "[T]o [U]pper case")
keybinding("i", "<localleader>tl", "<esc>mmbguiw`ma", "[T]o [L]ower case")

keybinding("n", "<leader>0g", ":0G<CR>")

keybinding("n", "<localleader>lz", ":Lazy<CR>", "[L]a[Z]y")
keybinding("n", "<localleader>ms", ":Mason<CR>", "[M]a[S]y")

keybinding("n", "[b", ":bprev<CR>", "[P]revious [B]uffer")
keybinding("n", "]b", ":bnext<CR>", "[N]ext [B]uffer")

-- experimental

keybinding("n", "<localleader>ch", ":checkhealth<CR>", "[C]heck [H]ealth")

keybinding("n", "<localleader>x", ":so %<CR>", "E[x]ecute this file")

keybinding("n", "<localleader>pg", ":InspectTree<CR>", "[P]lay[G]round")

keybinding("t", "<esc><esc>", [[<C-\><C-N>]], "Normal mode from Terminal-mode")
