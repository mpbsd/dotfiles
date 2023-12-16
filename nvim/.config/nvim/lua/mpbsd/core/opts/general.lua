local M = {
  g = {
    mapleader = " ",
    maplocalleader = ",",
    loaded_perl_provider = 0,
    loaded_ruby_provider = 0,
    python3_host_prog = "/usr/bin/python3",
    tex_flavor = "latex",
  },
  o = {
    number = true,
    relativenumber = true,
    numberwidth = 6,
    cursorline = true,
    cursorcolumn = true,
    colorcolumn = "80",
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    wrap = true,
    linebreak = true,
    list = false,
    splitright = true,
    splitbelow = true,
    hlsearch = false,
    ignorecase = true,
    smartcase = true,
    magic = true,
    lazyredraw = true,
    spelllang = "en_us,pt_br",
    spellsuggest = "fast,20",
    showmode = true,
    termguicolors = true,
    undofile = true,
  },
}

for lhs, rhs in pairs(M.g) do
  vim.g[lhs] = rhs
end

for lhs, rhs in pairs(M.o) do
  vim.o[lhs] = rhs
end
