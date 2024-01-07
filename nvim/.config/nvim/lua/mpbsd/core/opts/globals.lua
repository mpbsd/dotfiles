local globals = {}

globals.vim_keymap_set = function(mappings_table)
  for _, keymap in pairs(mappings_table) do
    local mod = keymap['mod']
    local lhs = keymap['lhs']
    local rhs = keymap['rhs']
    local opt = keymap['opt']
    vim.keymap.set(mod, lhs, rhs, opt)
    -- vim.keymap.set(unpack(keymap))
  end
end

globals.subs_cword_with_whatever_is_in_reg_zero = function()
  local pos = vim.fn.getpos('.')
  local reg = vim.fn.getreg('0')
  local cword = vim.fn.expand('<cword>')
  local cmd = '%s/' .. cword .. '/' .. reg .. '/g'
  vim.cmd(cmd)
  vim.fn.setpos('.', pos)
end

globals.vim_inspect = function(v)
  print(vim.inspect(v))
  return v
end

if vim.fn.has('nvim-0.9.5') then
  globals.vim_uv = vim.loop
else
  globals.vim_uv = vim.uv
end

return globals
