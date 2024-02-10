local M = {
  var = {
    cmd = vim.g,
    opt = {
      mapleader = ' ',
      maplocalleader = ',',
      tex_flavour = 'latex',
    }
  },
  cfg = {
    cmd = vim.opt,
    opt = {
      number = true,
      relativenumber = true,
      numberwidth = 6,
      cursorline = true,
      cursorcolumn = true,
      tabstop = 2,
      shiftwidth = 2,
      expandtab = true,
      splitright = true,
      splitbelow = true,
      colorcolumn = '80',
      path = { '**' },
    }
  }
}

for categ, _ in pairs(M) do
  local cmd = M[categ]['cmd']
  local opt = M[categ]['opt']
  for lhs, rhs in pairs(opt) do
    cmd[lhs] = rhs
  end
end
