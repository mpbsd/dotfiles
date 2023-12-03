Keymap = function(m, k, v)
  vim.keymap.set(m, k, v, { noremap=true })
end

function P(v)
  print(vim.inspect(v))
  return v
end
