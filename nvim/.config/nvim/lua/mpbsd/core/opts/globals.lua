local M = {}

M.vim_keymap_set = function(mappings_table)
  for _, mapping in pairs(mappings_table) do
    local mod = mapping['mod']
    local lhs = mapping['lhs']
    local rhs = mapping['rhs']
    local opt = mapping['opt']
    vim.keymap.set(mod, lhs, rhs, opt)
  end
end

M.vim_create_autocmd = function(autocmds_table)
  for _, autocmd in pairs(autocmds_table) do
    local evt = autocmd['evt']
    local ptn = autocmd['ptn']
    local cmd = autocmd['cmd']
    local grp = autocmd['grp']
    vim.api.nvim_create_autocmd(
    evt,
    {
      pattern = ptn,
      command = cmd,
      group = vim.api.nvim_create_augroup(grp, { clear = true })
    }
    )
  end
end

if vim.fn.has('nvim-0.9.5') then
  M.vim_uv = vim.loop
else
  M.vim_uv = vim.uv
end

return M
