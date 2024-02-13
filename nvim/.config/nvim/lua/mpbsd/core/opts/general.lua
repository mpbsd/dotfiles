local options = {
  var = {
    cmd = vim.g,
    opt = {
      mapleader = ' ',
      maplocalleader = ',',
      tex_flavour = 'latex',
      loaded_perl_provider = 0,
      loaded_ruby_provider = 0,
      python3_host_prog = '/usr/bin/python3',
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
      hlsearch = false,
      path = { '**' },
      termguicolors = true,
    }
  },
  env = {
    cmd = vim.env,
    opt = {
      SHELL = '/usr/bin/bash',
    }
  },
}

for section, _ in pairs(options) do
  local cmd = options[section]['cmd']
  local opt = options[section]['opt']
  for lhs, rhs in pairs(opt) do
    cmd[lhs] = rhs
  end
end
