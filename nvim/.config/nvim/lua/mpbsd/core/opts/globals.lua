local M = {}

M.nvim_set_keymaps = function(table_of_mappings)
  for _, map in pairs(table_of_mappings) do
    vim.keymap.set(map['mod'], map['lhs'], map['rhs'], map['opt'])
  end
end

M.nvim_create_augroup = function(table_of_autocmds)
  local augroup = {}
  for _, autocmd in pairs(table_of_autocmds) do
    local opts = autocmd['opts']
    if opts['group'] ~= nil then
      augroup['group'] = vim.api.nvim_create_augroup(
        opts['group'],
        { clear = true }
      )
    end
  end
  return augroup
end

M.nvim_create_autocmd = function(table_of_autocmds)
  local augroup = M.nvim_create_augroup(table_of_autocmds)
  for _, autocmd in pairs(table_of_autocmds) do
    local event = autocmd['event']
    local opts = autocmd['opts']
    if opts['group'] ~= nil then
      opts['group'] = augroup[opts['group']]
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

M.adapters = { -- {{{
  'cppdbg',
  'python',
} -- }}}

M.nvim_version = function()
  local V = vim.version()
  return string.format("nvim-%s.%s.%s", V.major, V.minor, V.patch)
end

return M
