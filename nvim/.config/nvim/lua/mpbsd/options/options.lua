vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog    = "/usr/bin/python3"
vim.g.tex_flavor           = "latex"

local opts = {
  cursorcolumn   = true,
  cursorline     = true,
  expandtab      = true,
  hlsearch       = false,
  ignorecase     = true,
  lazyredraw     = true,
  number         = true,
  relativenumber = true,
  shiftwidth     = 2,
  smartcase      = true,
  spelllang      = "en_us,pt_br",
  spellsuggest   = "fast,20",
  splitbelow     = true,
  splitright     = true,
  tabstop        = 2,
  termguicolors  = true,
  wrap           = false,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
