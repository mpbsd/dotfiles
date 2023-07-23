local imap = function(k, v)
  vim.keymap.set("i", k, v, { noremap=true, silent=true })
end

local nmap = function(k, v)
  vim.keymap.set("n", k, v, { noremap=true, silent=true })
end

imap("jj", "<esc>")

nmap("<leader>;", ":")
nmap("rw", ":Ex<cr>")

nmap("<leader>erc", ":e ~/.config/nvim/init.lua<cr>")
nmap("<leader>eop", ":e ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
nmap("<leader>ekm", ":e ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
nmap("<leader>eau", ":e ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
nmap("<leader>egl", ":e ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
nmap("<leader>epg", ":e ~/.config/nvim/lua/mpbsd/plugins<cr>")
