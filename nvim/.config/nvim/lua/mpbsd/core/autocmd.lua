vim.api.nvim_create_augroup("marker_foldmethod", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "h", "lua", "markdown", "python", "sh", "tex" },
  command = "setlocal foldmethod=marker",
  group = "marker_foldmethod",
})
