local options = {
  glo = { -- {{{
    cmd = vim.g,
    cfg = {
      mapleader = ' ',
      maplocalleader = ',',
      tex_flavor = 'latex',
      loaded_perl_provider = 0,
      loaded_ruby_provider = 0,
      node_host_prog = '/usr/bin/npm',
      python3_host_prog = '/usr/bin/python3',
    }     -- }}}
  },
  opt = { -- {{{
    cmd = vim.opt,
    cfg = {
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
      ignorecase = true,
      smartcase = true,
      magic = true,
      lazyredraw = true,
      path = { '**' },
      joinspaces = false,
      termguicolors = true,
      spelllang = { 'en_us', 'pt_br' },
      spellsuggest = { 'fast', '10' },
    }     -- }}}
  },
  env = { -- {{{
    cmd = vim.env,
    cfg = {
      SHELL = '/usr/bin/bash',
    } -- }}}
  }
}

for section, _ in pairs(options) do
  local cmd = options[section]['cmd']
  local cfg = options[section]['cfg']
  for lhs, rhs in pairs(cfg) do
    cmd[lhs] = rhs
  end
end
