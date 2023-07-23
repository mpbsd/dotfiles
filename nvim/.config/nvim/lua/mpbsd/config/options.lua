local G = {
  mapleader = " ",
  maplocalleader = ",",
  tex_flavor = "latex",
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  python3_host_prog = "/usr/bin/python3",
}

for k, v in pairs(G) do
  vim.g[k] = v
end

local O = {
  cursorcolumn = true,
  cursorline = true,
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
}

for k, v in pairs(O) do
  vim.o[k] = v
end
