local G = {
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  mapleader            = ",",
  maplocalleader       = " ",
  python3_host_prog    = "/usr/bin/python3",
  tex_flavor           = "latex",
}

for lhs, rhs in pairs(G) do
  vim.g[lhs] = rhs
end

local O = {
  clipboard      = "unnamedplus",
  colorcolumn    = "80",
  cursorcolumn   = true,
  cursorline     = true,
  lazyredraw     = true,
  linebreak      = true,
  list           = false,
  number         = true,
  relativenumber = true,
  numberwidth    = 6,
  tabstop        = 2,
  shiftwidth     = 2,
  expandtab      = true,
  autoindent     = true,
  smartindent    = true,
  ignorecase     = true,
  smartcase      = true,
  magic          = true,
  spelllang      = "en_us,pt_br",
  spellsuggest   = "fast,20",
  splitbelow     = true,
  splitright     = true,
  termguicolors  = true,
  undofile       = true,
}

for lhs, rhs in pairs(O) do
  vim.o[lhs] = rhs
end
