return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function()
    local configs = require('nvim-treesitter.configs')
    local rept_move = require('nvim-treesitter.textobjects.repeatable_move')
    local globals = require('mpbsd.core.opts.globals')
    configs.setup({
      ensure_installed = {
        'c',
        'latex',
        'bibtex',
        'jsonc',
        'ledger',
        'lua',
        'python',
        'rust',
        'vim',
        'vimdoc'
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {
        'javascript',
      },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(
            vim.uv.fs_stat,
            vim.api.nvim_buf_get_name(buf)
          )
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection    = '<c-space>',
          node_incremental  = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental  = '<M-space>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['a]'] = '@class.outer',
            ['i]'] = '@class.inner',
            ['ab'] = '@block.outer',
            ['ib'] = '@block.inner',
            ['am'] = '@function.outer',
            ['im'] = '@function.inner',
            ['ac'] = '@conditional.outer',
            ['ic'] = '@conditional.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['a='] = '@assignment.outer',
            ['l='] = '@assignment.lhs',
            ['r='] = '@assignment.rhs',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']]'] = '@class.outer',
            [']m'] = '@function.outer',
          },
          goto_next_end = {
            [']['] = '@class.outer',
            [']M'] = '@function.outer',
          },
          goto_previous_start = {
            ['[['] = '@class.outer',
            ['[m'] = '@function.outer',
          },
          goto_previous_end = {
            ['[]'] = '@class.outer',
            ['[M'] = '@function.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    })
    globals.nvim_set_keymaps({ -- {{{
      {
        mod = { 'n', 'x', 'o' },
        lhs = ';',
        rhs = rept_move.repeat_last_move,
        opt = {}
      },
      {
        mod = { 'n', 'x', 'o' },
        lhs = ',',
        rhs = rept_move.repeat_last_move_opposite,
        opt = {}
      },
      {
        mod = { 'n', 'x', 'o' },
        lhs = 'f',
        rhs = rept_move.builtin_f_expr,
        opt = {expr=true}
      },
      {
        mod = { 'n', 'x', 'o' },
        lhs = 'F',
        rhs = rept_move.builtin_F_expr,
        opt = {expr=true}
      },
      {
        mod = { 'n', 'x', 'o' },
        lhs = 't',
        rhs = rept_move.builtin_t_expr,
        opt = {expr=true}
      },
      {
        mod = { 'n', 'x', 'o' },
        lhs = 'T',
        rhs = rept_move.builtin_T_expr,
        opt = {expr=true}
      },
    }) -- }}}
  end
}
