local G = {
  -- leader key -> <spc>
  mapleader = " ",
  -- localleader key -> <,>
  maplocalleader = ",",
  -- tex flavor
  tex_flavor = "latex",
}

for k, v in pairs(G) do
  vim.g[k] = v
end

local O = {
  -- easily locate cursor
  cursorcolumn = true,
  cursorline = true,
  -- line numbers
  number = true,
  relativenumber = true,
  -- splits
  splitbelow = true,
  splitright = true,
  -- indenting
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
}

for k, v in pairs(O) do
  vim.o[k] = v
end

vim.cmd [[colorscheme habamax]]
