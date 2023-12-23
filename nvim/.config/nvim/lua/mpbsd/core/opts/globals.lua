function Keymap(table_of_keymaps)
  for _, keymap in pairs(table_of_keymaps) do
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
