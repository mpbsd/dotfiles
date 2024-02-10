local globals = {}

globals.let_mason_install_linters_and_formatters = function()
  local mason_registry = require('mason-registry')
  local mason_pkgs = {
    ['linter'] = {
      'flake8',
      'misspell',
      'shellcheck',
      'vint',
    },
    ['formatter'] = {
      'isort',
      'black',
    },
  }
  for _, pkg_category in pairs(mason_pkgs) do
    for _, pkg_name in pairs(pkg_category) do
      if not mason_registry.is_installed(pkg_name) then
        vim.cmd(':MasonInstall ' .. pkg_name)
      end
    end
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
end

globals.vim_keymap_set = function(mappings_table)
  for _, keymap in pairs(mappings_table) do
    local mod = keymap['mod']
    local lhs = keymap['lhs']
    local rhs = keymap['rhs']
    local opt = keymap['opt']
    vim.keymap.set(mod, lhs, rhs, opt)
  end
end

globals.vim_mode = function()
  -- modes {{{
  local modes = {
    ['n'] = {
      ['mod'] = 'NORMAL',
      ['des'] = 'Normal',
    },
    ['no'] = {
      ['mod'] = 'O-PENDING',
      ['des'] = 'Operator-pending',
    },
    ['nov'] = {
      ['mod'] = 'O-PENDING',
      ['des'] = 'Operator-pending (forced characterwise |o_v|)',
    },
    ['noV'] = {
      ['mod'] = 'O-PENDING',
      ['des'] = 'Operator-pending (forced linewise |o_V|)',
    },
    ['noCTRL-V'] = {
      ['mod'] = 'O-PENDING',
      ['des'] = 'Operator-pending (forced blockwise |o_CTRL-V|);',
    },
    ['niI'] = {
      ['mod'] = 'NORMAL',
      ['des'] = 'Normal using |i_CTRL-O| in |Insert-mode|',
    },
    ['niR'] = {
      ['mod'] = 'NORMAL',
      ['des'] = 'Normal using |i_CTRL-O| in |Replace-mode|',
    },
    ['niV'] = {
      ['mod'] = 'NORMAL',
      ['des'] = 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|',
    },
    ['nt'] = {
      ['mod'] = 'NORMAL',
      ['des'] = 'Terminal-Normal (insert goes to Terminal-Job mode)',
    },
    ['v'] = {
      ['mod'] = 'VISUAL',
      ['des'] = 'Visual by character',
    },
    ['vs'] = {
      ['mod'] = 'VISUAL',
      ['des'] = 'Visual by character using |v_CTRL-O| in Select mode',
    },
    ['V'] = {
      ['mod'] = 'VISUAL',
      ['des'] = 'Visual by line',
    },
    ['Vs'] = {
      ['mod'] = 'VISUAL',
      ['des'] = 'Visual by line using |v_CTRL-O| in Select mode',
    },
    ['CTRL-V'] = {
      ['mod'] = 'VISUAL',
      ['des'] = 'Visual blockwise',
    },
    ['CTRL-Vs'] = {
      ['mod'] = 'VISUAL',
      ['des'] = 'Visual blockwise using |v_CTRL-O| in Select mode',
    },
    ['s'] = {
      ['mod'] = 'SELECT',
      ['des'] = 'Select by character',
    },
    ['S'] = {
      ['mod'] = 'SELECT',
      ['des'] = 'Select by line',
    },
    ['CTRL-S'] = {
      ['mod'] = 'SELECT',
      ['des'] = 'Select blockwise',
    },
    ['i'] = {
      ['mod'] = 'INSERT',
      ['des'] = 'Insert',
    },
    ['ic'] = {
      ['mod'] = 'INSERT',
      ['des'] = 'Insert mode completion |compl-generic|',
    },
    ['ix'] = {
      ['mod'] = 'INSERT',
      ['des'] = 'Insert mode |i_CTRL-X| completion',
    },
    ['R'] = {
      ['mod'] = 'REPLACE',
      ['des'] = 'Replace |R|',
    },
    ['Rc'] = {
      ['mod'] = 'REPLACE',
      ['des'] = 'Replace mode completion |compl-generic|',
    },
    ['Rx'] = {
      ['mod'] = 'REPLACE',
      ['des'] = 'Replace mode |i_CTRL-X| completion',
    },
    ['Rv'] = {
      ['mod'] = 'REPLACE',
      ['des'] = 'Virtual Replace |gR|',
    },
    ['Rvc'] = {
      ['mod'] = 'REPLACE',
      ['des'] = 'Virtual Replace mode completion |compl-generic|',
    },
    ['Rvx'] = {
      ['mod'] = 'REPLACE',
      ['des'] = 'Virtual Replace mode |i_CTRL-X| completion',
    },
    ['c'] = {
      ['mod'] = 'COMMAND',
      ['des'] = 'Command-line editing',
    },
    ['cv'] = {
      ['mod'] = 'COMMAND',
      ['des'] = 'Vim Ex mode |gQ|',
    },
    ['ce'] = {
      ['mod'] = 'COMMAND',
      ['des'] = 'Normal Ex mode |Q|',
    },
    ['r'] = {
      ['mod'] = 'PROMPT',
      ['des'] = 'Hit-enter prompt',
    },
    ['rm'] = {
      ['mod'] = 'PROMPT',
      ['des'] = 'The -- more -- prompt',
    },
    ['r?'] = {
      ['mod'] = 'CONFIRM',
      ['des'] = 'A |:confirm| query of some sort',
    },
    ['!'] = {
      ['mod'] = 'EXTERNAL',
      ['des'] = 'Shell or external command is executing',
    },
    ['t'] = {
      ['mod'] = 'TERMINAL',
      ['des'] = 'Terminal-Job mode: keys go to the job',
    },
  }
  -- }}}
  local mode = vim.api.nvim_get_mode()['mode']
  return modes[mode]['mod']
end

-- globals.my_statusline = function()
--   -- options {{{
--   local stl_opts = {
--     ['lhs'] = {
--       {
--         ['cmd'] = '[%n]',
--         ['des'] = 'buffer number',
--       },
--       {
--         ['cmd'] = globals.show_vim_mode,
--         ['des'] = 'current mode',
--       },
--       {
--         ['cmd'] = '%t',
--         ['des'] = 'tail of the file in the buffer',
--       },
--       {
--         ['cmd'] = '%m',
--         ['des'] = 'modified flag',
--       },
--     },
--     ['sep'] = {
--       {
--         ['cmd'] = '%=',
--         ['des'] = 'lhs/rhs separator',
--       },
--     },
--     ['rhs'] = {
--       {
--         ['cmd'] = '%{&fenc}',
--         ['des'] = 'file encoding',
--       },
--       {
--         ['cmd'] = '%{&ff}',
--         ['des'] = 'file format',
--       },
--       {
--         ['cmd'] = '%Y',
--         ['des'] = 'type of file in the buffer',
--       },
--       {
--         ['cmd'] = '%P',
--         ['des'] = 'percentage through file of splayed window',
--       },
--       {
--         ['cmd'] = '(%06l:%06v)',
--         ['des'] = 'line and column numbers',
--       },
--     },
--   }
--   -- }}}
-- end

if vim.fn.has('nvim-0.9.5') then
  globals.vim_uv = vim.loop
else
  globals.vim_uv = vim.uv
end

return globals
