vim.keymap.set(
"n",
"<leader>vfd",
function()
  vim.cmd([[ %s/\<\(0[1-9]\|[12][0-9]\|3[01]\)[/-]\(0[1-9]\|1[012]\)[/-]\([0-9]\{4\}\)\>/\3\2\1/g ]])
end,
{
  noremap = true,
  silent = true,
  desc = "Let Vim do the hard work!"
}
)

vim.keymap.set("n", "<leader><leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>q", ":q<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>0g", ":0G<CR>", { noremap = true, silent = true })
