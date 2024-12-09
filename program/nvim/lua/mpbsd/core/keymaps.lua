local KEY = {
  ["i"] = {
    ["<localleader>tu"] = "<esc>mmBgUiW`ma",
    ["<localleader>tl"] = "<esc>mmBguiW`ma",
    ["<localleader>cc"] = "<esc>mmB~`ma",
  },
  ["n"] = {
    ["<leader>rci"] = ":e ~/.config/nvim/init.lua<CR>",
    ["<leader>rco"] = ":e ~/.config/nvim/lua/mpbsd/core/options.lua<CR>",
    ["<leader>rcg"] = ":e ~/.config/nvim/lua/mpbsd/core/globals.lua<CR>",
    ["<leader>rck"] = ":e ~/.config/nvim/lua/mpbsd/core/keymaps.lua<CR>",
    ["<leader>rcp"] = ":e ~/.config/nvim/lua/mpbsd/pkgs<CR>",
    ["<leader>rcs"] = ":so %<CR>",
  },
}

local OPT = { noremap = true, silent = true }

local setkey = function(KEY, OPT)
  for mod, _ in pairs(KEY) do
    for lhs, rhs in pairs(KEY[mod]) do
      vim.keymap.set(mod, lhs, rhs, OPT)
    end
  end
end

setkey(KEY, OPT)
