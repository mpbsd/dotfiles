local G = {
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  mapleader = ",",
  maplocalleader = " ",
  python3_host_prog = "/usr/bin/python3",
  tex_flavor = "latex",
}

for lhs, rhs in pairs(G) do
  vim.g[lhs] = rhs
end

local O = {
  number = true,
  relativenumber = true,
  numberwidth = 6,
  colorcolumn = "80",
  textwidth = 80,
  wrap = true,
  linebreak = true,
  list = false,
  cursorcolumn = true,
  cursorline = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  ignorecase = true,
  smartcase = true,
  magic = true,
  hlsearch = false,
  splitbelow = true,
  splitright = true,
  spelllang = { "en_us", "pt_br" },
  spellsuggest = { "fast", "20" },
  termguicolors = true,
  undofile = true,
  clipboard = "unnamedplus",
  lazyredraw = true,
}

for lhs, rhs in pairs(O) do
  vim.opt[lhs] = rhs
end
