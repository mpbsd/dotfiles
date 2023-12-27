function KeymapSet(keymaps_table)
  for _, keymap in pairs(keymaps_table) do
    local mod = keymap["mod"]
    local lhs = keymap["lhs"]
    local rhs = keymap["rhs"]
    local opt = keymap["opt"]
    vim.keymap.set(mod, lhs, rhs, opt)
  end
end

function P(v)
  print(vim.inspect(v))
  return v
end

if vim.fn.has("nvim-0.10.0") then
  Libuv = vim.uv
else
  Libuv = vim.loop
end
