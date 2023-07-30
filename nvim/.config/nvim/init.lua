require("mpbsd.config.options")
require("mpbsd.config.keymaps")
require("mpbsd.config.autocmd")
require("mpbsd.config.globals")

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("mpbsd.plugins", {})

-- vim: ts=2 sw=2 et
