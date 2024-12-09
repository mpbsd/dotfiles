local marker_foldmethod = vim.api.nvim_create_augroup("marker_foldmethod_for_filetypes", { clear = true })

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = marker_foldmethod,
    pattern = {
      "lua",
      "python",
    },
    command = [[setlocal foldmethod=marker]]
  }
)
