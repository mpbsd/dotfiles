local options = {
  glo = { -- {{{
    cmd = vim.g,
    cfg = {
      loaded_perl_provider = 0,
      loaded_ruby_provider = 0,
      mapleader = " ",
      maplocalleader = ",",
      netrw_banner = 0,
      -- netrw_list_hide = '^\..*',
      node_host_prog = "/usr/bin/npm",
      python3_host_prog = "~/.local/share/python3/bin/python3",
      tex_flavor = "latex",
    }     -- }}}
  },
  opt = { -- {{{
    cmd = vim.opt,
    cfg = {
      colorcolumn = "80",
      cursorcolumn = true,
      cursorline = true,
      expandtab = true,
      hlsearch = false,
      ignorecase = true,
      joinspaces = false,
      lazyredraw = true,
      magic = true,
      number = true,
      numberwidth = 6,
      path = { "**" },
      relativenumber = true,
      ruler = false,
      shiftwidth = 2,
      smartcase = true,
      spelllang = { "en_us", "pt_br", "de_de" },
      spellsuggest = { "fast", "10" },
      splitbelow = true,
      splitright = true,
      tabstop = 2,
      termguicolors = true,
    }     -- }}}
  },
  env = { -- {{{
    cmd = vim.env,
    cfg = {
      SHELL = "/usr/bin/bash",
    } -- }}}
  }
}

for section, _ in pairs(options) do
  local cmd = options[section]["cmd"]
  local cfg = options[section]["cfg"]
  for lhs, rhs in pairs(cfg) do
    cmd[lhs] = rhs
  end
end
