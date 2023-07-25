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
  number = true,
  relativenumber = true,
  cursorcolumn = true,
  cursorline = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,
  lazyredraw = true,
  spelllang = "en_us,pt_br",
  spellsuggest = "fast,20",
  splitbelow = true,
  splitright = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  termguicolors = true,
  undofile = true,
}

for k, v in pairs(O) do
  vim.o[k] = v
end
