-- key mapping functions {{{
kmap = function(m, k, v)
  vim.keymap.set(m, k, v, { noremap=true })
end
-- }}}
-- Testing {{{
function P(v)
  print(vim.inspect(v))
  return v
end
-- }}}
