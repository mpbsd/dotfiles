local M = {}

M.keymapset = function(keymaps_table)
  for _, keymap in pairs(keymaps_table) do
    local mod = keymap["mod"]
    local lhs = keymap["lhs"]
    local rhs = keymap["rhs"]
    local opt = keymap["opt"]
    vim.keymap.set(mod, lhs, rhs, opt)
  end
end

M.inspect = function(v)
  print(vim.inspect(v))
  return v
end

if vim.fn.has("nvim-0.10.0") then
  M.libuv = vim.uv
else
  M.libuv = vim.loop
end

return M
