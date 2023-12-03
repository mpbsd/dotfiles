vim.api.nvim_create_augroup("autoload_folds", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "*.c", "*.h", "*.lua", "*.md", "*.py", "*.tex" },
  command = "mkview",
  group = "autoload_folds"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.c", "*.h", "*.lua", "*.md", "*.py", "*.tex" },
  command = "silent! loadview",
  group = "autoload_folds"
})
