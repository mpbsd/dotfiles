-- mapping functions {{{
local imap = function(k, v)
  vim.keymap.set("i", k, v, { noremap=true })
end

local nmap = function(k, v)
  vim.keymap.set("n", k, v, { noremap=true })
end
-- }}}

imap("jj", "<esc>")
nmap("<leader>;", ":")

nmap("<localleader>fw", ":w<cr>")
nmap("<localleader>fq", ":q<cr>")

imap("<localleader>tu", "<esc>mmbgUiw`ma")
imap("<localleader>tl", "<esc>mmbguiw`ma")
imap("<localleader>cc", "<esc>mmb~`ma")

nmap("<leader>ex", ":Explore<cr>")

nmap("<leader>erc", ":edit ~/.config/nvim/init.lua<cr>")
nmap("<leader>eop", ":edit ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
nmap("<leader>ekm", ":edit ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
nmap("<leader>eau", ":edit ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
nmap("<leader>egl", ":edit ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
nmap("<leader>epg", ":edit ~/.config/nvim/lua/mpbsd/plugin<cr>")

-- window management {{{
nmap("<localleader>sp", ":sp<cr>")
nmap("<localleader>vs", ":vs<cr>")

nmap("<c-h>", "<c-w>h")
nmap("<c-j>", "<c-w>j")
nmap("<c-k>", "<c-w>k")
nmap("<c-l>", "<c-w>l")

local resizing = {
  lhs = {
    "<c-left>",
    "<c-down>",
    "<c-up>",
    "<c-right>",
  },
  rhs = {
    "<c-w>>",
    "<c-w>-",
    "<c-w>+",
    "<c-w><",
  }
}

for i=1,4 do
  nmap(resizing.lhs[i], resizing.rhs[i])
end
-- }}}
