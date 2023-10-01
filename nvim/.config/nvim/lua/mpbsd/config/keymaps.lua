-- mapping functions {{{
local imap = function(k, v)
  vim.keymap.set("i", k, v, { noremap=true })
end
local nmap = function(k, v)
  vim.keymap.set("n", k, v, { noremap=true })
end
-- }}}
-- edit config files {{{
nmap("<leader>erc", ":edit ~/.config/nvim/init.lua<cr>")

nmap("<leader>eop", ":edit ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
nmap("<leader>ekm", ":edit ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
nmap("<leader>egl", ":edit ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
nmap("<leader>eau", ":edit ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
nmap("<leader>eab", ":edit ~/.config/nvim/lua/mpbsd/config/abbrevs.lua<cr>")

nmap("<leader>epg", ":edit ~/.config/nvim/lua/mpbsd/plugin<cr>")

nmap("<leader>sop", ":source ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
nmap("<leader>skm", ":source ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
nmap("<leader>sgl", ":source ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
nmap("<leader>sau", ":source ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
nmap("<leader>sab", ":source ~/.config/nvim/lua/mpbsd/config/abbrevs.lua<cr>")
-- }}}
-- windows {{{
nmap("<localleader>sp", ":sp<cr>")
nmap("<localleader>vs", ":vs<cr>")
-- navigation
nmap("<c-h>", "<c-w>h")
nmap("<c-j>", "<c-w>j")
nmap("<c-k>", "<c-w>k")
nmap("<c-l>", "<c-w>l")
-- resizing
nmap("<c-left>" , "<c-w>>")
nmap("<c-down>" , "<c-w>-")
nmap("<c-up>"   , "<c-w>+")
nmap("<c-right>", "<c-w><")
-- }}}
-- capitalization {{{
imap("<localleader>tu", "<esc>mmbgUiw`ma")
imap("<localleader>tl", "<esc>mmbguiw`ma")
imap("<localleader>cc", "<esc>mmb~`ma")
-- }}}

imap("jj", "<esc>")
nmap("<leader>;", ":")

nmap("<localleader>fw", ":w<cr>")
nmap("<localleader>fq", ":q<cr>")

nmap("<localleader>ex", ":Explore<cr>")
