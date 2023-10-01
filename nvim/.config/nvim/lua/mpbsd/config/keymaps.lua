-- edit config files {{{
kmap("n", "<leader>erc", ":edit ~/.config/nvim/init.lua<cr>")

kmap("n", "<leader>eop", ":edit ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
kmap("n", "<leader>ekm", ":edit ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
kmap("n", "<leader>egl", ":edit ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
kmap("n", "<leader>eau", ":edit ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
kmap("n", "<leader>eab", ":edit ~/.config/nvim/lua/mpbsd/config/abbrevs.lua<cr>")

kmap("n", "<leader>epg", ":edit ~/.config/nvim/lua/mpbsd/plugin<cr>")

kmap("n", "<leader>sop", ":source ~/.config/nvim/lua/mpbsd/config/options.lua<cr>")
kmap("n", "<leader>skm", ":source ~/.config/nvim/lua/mpbsd/config/keymaps.lua<cr>")
kmap("n", "<leader>sgl", ":source ~/.config/nvim/lua/mpbsd/config/globals.lua<cr>")
kmap("n", "<leader>sau", ":source ~/.config/nvim/lua/mpbsd/config/autocmd.lua<cr>")
kmap("n", "<leader>sab", ":source ~/.config/nvim/lua/mpbsd/config/abbrevs.lua<cr>")
-- }}}
-- windows {{{
kmap("n", "<localleader>sp", ":sp<cr>")
kmap("n", "<localleader>vs", ":vs<cr>")
-- navigation
kmap("n", "<c-h>", "<c-w>h")
kmap("n", "<c-j>", "<c-w>j")
kmap("n", "<c-k>", "<c-w>k")
kmap("n", "<c-l>", "<c-w>l")
-- resizing
kmap("n", "<c-left>" , "<c-w>>")
kmap("n", "<c-down>" , "<c-w>-")
kmap("n", "<c-up>"   , "<c-w>+")
kmap("n", "<c-right>", "<c-w><")
-- }}}
-- capitalization {{{
kmap("i", "<localleader>tu", "<esc>mmbgUiw`ma")
kmap("i", "<localleader>tl", "<esc>mmbguiw`ma")
kmap("i", "<localleader>cc", "<esc>mmb~`ma")
-- }}}

kmap("i", "jj", "<esc>")
kmap("n", "<leader>;", ":")

kmap("n", "<localleader>fw", ":w<cr>")
kmap("n", "<localleader>fq", ":q<cr>")

kmap("n", "<localleader>ex", ":Explore<cr>")
kmap("n", "<localleader>se", ":lua require('luasnip.loaders').edit_snippet_files()<cr>")
