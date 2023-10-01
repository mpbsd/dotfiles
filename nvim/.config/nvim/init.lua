-- opts {{{
require("mpbsd.config.options")
require("mpbsd.config.globals")
require("mpbsd.config.keymaps")
require("mpbsd.config.autocmd")
require("mpbsd.config.abbrevs")
-- }}}
-- lazy {{{
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("mpbsd.plugin", {})
-- }}}
