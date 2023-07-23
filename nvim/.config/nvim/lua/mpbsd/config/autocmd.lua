vim.api.nvim_create_augroup("PersistentFolds", { clear=true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "*.c", "*.h", "*.lua", "*.md", "*.py", "*.tex" },
  command = "mkview",
  group = "PersistentFolds"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.c", "*.h", "*.lua", "*.md", "*.py", "*.tex" },
  command = "silent! loadview",
  group = "PersistentFolds"
})

vim.api.nvim_create_augroup("AutoWrapping", { clear=true })

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.c", "*.h", "*.lua", "*.md", "*.py", "*.tex" },
  command = "setlocal textwidth=80",
  group = "AutoWrapping"
})
