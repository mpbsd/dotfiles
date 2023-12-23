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
  autoindent     = true,
  clipboard      = "unnamedplus",
  -- colorcolumn    = "80",
  cursorcolumn   = true,
  cursorline     = true,
  expandtab      = true,
  ignorecase     = true,
  lazyredraw     = true,
  linebreak      = true,
  list           = false,
  magic          = true,
  number         = true,
  numberwidth    = 6,
  relativenumber = true,
  shiftwidth     = 2,
  smartcase      = true,
  smartindent    = true,
  spelllang      = "en_us,pt_br",
  spellsuggest   = "fast,20",
  splitbelow     = true,
  splitright     = true,
  tabstop        = 2,
  termguicolors  = true,
  undofile       = true,
}

for lhs, rhs in pairs(O) do
  vim.o[lhs] = rhs
end
