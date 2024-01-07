local latex_editing_made_easy = vim.api.nvim_create_augroup('latex_editing_made_easy', { clear = true })
local marker_foldmethod = vim.api.nvim_create_augroup('marker_foldmethod', { clear = true })
local remove_traling_spaces = vim.api.nvim_create_augroup('remove_traling_spaces', { clear = true })

vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = { '*.tex' },
    callback = function()
      local globals = require('mpbsd.core.opts.globals')
      local keymaps = { -- {{{
        {
          mod = 'n',
          lhs = '<localleader>mk',
          rhs = ':make<cr>',
          opt = {
            noremap = true,
            desc = '[m]a[k]e',
          }
        },
        {
          mod = 'n',
          lhs = '<localleader>mb',
          rhs = ':make bib<cr>',
          opt = {
            noremap = true,
            desc = '[m]ake [b]ib',
          }
        },
        {
          mod = 'n',
          lhs = '<localleader>mc',
          rhs = ':make clean<cr>',
          opt = {
            noremap = true,
            desc = '[m]ake [c]lean',
          }
        },
        {
          mod = 'n',
          lhs = '<localleader>mf',
          rhs = ':make final<cr>',
          opt = {
            noremap = true,
            desc = '[m]ake [f]inal',
          }
        },
      } -- }}}
      globals.vim_keymap_set(keymaps)
    end,
    group = latex_editing_made_easy,
  }
)

vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {
      'c',
      'h',
      'lua',
      'markdown',
      'python',
      'sh',
      'tex'
    },
    command = 'setlocal foldmethod=marker',
    group = marker_foldmethod,
  }
)

vim.api.nvim_create_autocmd(
  'BufWritePre',
  {
    pattern = {
      '*.c',
      '*.h',
      '*.lua',
      '*.markdown',
      '*.python',
      '*.sh',
      '*.tex'
    },
    callback = function()
      local pos = vim.fn.getpos('.')
      local reg = vim.fn.getreg('/')
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos('.', pos)
      vim.fn.setreg('/', reg)
    end,
    group = remove_traling_spaces,
  }
)
