-- globals {{{
local G = {
  mapleader            = " ",
  maplocalleader       = ",",
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  python3_host_prog    = "/usr/bin/python3",
  tex_flavor           = "latex",
}

for k, v in pairs(G) do
  vim.g[k] = v
end
-- }}}
-- options {{{
local O = {
  number         = true,
  relativenumber = true,
  cursorcolumn   = true,
  cursorline     = true,
  cursorlineopt  = "number",
  hlsearch       = false,
  ignorecase     = true,
  smartcase      = true,
  lazyredraw     = true,
  spelllang      = "en_us,pt_br",
  spellsuggest   = "fast,20",
  showmode       = false,
  splitbelow     = true,
  splitright     = true,
  tabstop        = 2,
  shiftwidth     = 2,
  expandtab      = true,
  termguicolors  = true,
  undofile       = true,
  wrap           = false,
}

for k, v in pairs(O) do
  vim.o[k] = v
end
-- }}}
