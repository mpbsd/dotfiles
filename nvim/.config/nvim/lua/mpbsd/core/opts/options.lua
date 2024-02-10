local G = {
  mapleader = ' ',
  maplocalleader = ',',
  tex_flavour = 'latex',
}

for lhs, rhs in pairs(G) do
  vim.g[lhs] = rhs
end

local O = {
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
}

for lhs, rhs in pairs(O) do
	vim.o[lhs] = rhs
end
