local globals = {}

globals.vim_keymap_set = function(keymaps_table)
  for _, keymap in pairs(keymaps_table) do
    local mod = keymap["mod"]
    local lhs = keymap["lhs"]
    local rhs = keymap["rhs"]
    local opt = keymap["opt"]
    vim.keymap.set(mod, lhs, rhs, opt)
  end
end

globals.vim_inspect = function(v)
  print(vim.inspect(v))
  return v
end

if vim.fn.has("nvim-0.9.4") then
  globals.vim_uv = vim.loop
else
  globals.vim_uv = vim.uv
end

return globals
