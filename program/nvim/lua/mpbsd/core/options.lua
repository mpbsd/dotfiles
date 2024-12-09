local OPT = {
  ["C"] = {
    colorscheme = "retrobox",
  },
  ["G"] = {
    mapleader = " ",
    maplocalleader = ",",
    python3_host_prog = "/usr/bin/python3",
  },
  ["O"] = {
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    smartindent = true,
    number = true,
    relativenumber = true,
    ignorecase = true,
    smartcase = true,
    cursorline = true,
    colorcolumn = "80",
    textwidth = 80,
    clipboard = "unnamedplus",
  },
}

local setopt = function(OPT)
  for sec, _ in pairs(OPT) do
    for lhs, rhs in pairs(OPT[sec]) do
      if sec == "C" then
        vim.cmd(lhs .. " " .. rhs)
      elseif sec == "G" then
        vim.g[lhs] = rhs
      elseif sec == "O" then
        vim.o[lhs] = rhs
      end
    end
  end
end

setopt(OPT)
