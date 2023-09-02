local imap = function(k, v)
  vim.keymap.set("i", k, v, { noremap=true })
end

local nmap = function(k, v)
  vim.keymap.set("n", k, v, { noremap=true })
end

imap("jj", "<esc>")

imap("<localleader>tu", "<esc>mmbgUiw`ma")
imap("<localleader>tl", "<esc>mmbguiw`ma")

nmap("<leader>;", ":")
nmap("<leader>rw", ":Explore<cr>")

nmap("<leader>erc", ":edit ~/.config/nvim/init.lua<cr>")
nmap("<leader>eop", ":edit ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
nmap("<leader>ekm", ":edit ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
nmap("<leader>eau", ":edit ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
nmap("<leader>egl", ":edit ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
nmap("<leader>epg", ":edit ~/.config/nvim/lua/mpbsd/plugins<cr>")



-- vim: ts=2 sw=2 et
