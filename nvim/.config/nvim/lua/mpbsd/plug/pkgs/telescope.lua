return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')
    local globals = require('mpbsd.core.opts.globals')
    telescope.setup({
      defaults = {
        path_display = { 'absolute' },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      },
    })
    telescope.load_extension('fzf')
    globals.nvim_set_keymaps({
      -- keymaps {{{
      {
        mod = 'n',
        lhs = '<leader>?',
        rhs = builtin.oldfiles,
        opt = {
          desc = '[?] Find recently opened files',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>,',
        rhs = builtin.buffers,
        opt = {
          desc = '[,] Find existing buffers',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>/',
        rhs = function()
          builtin.current_buffer_fuzzy_find(
            themes.get_dropdown(
              { windblend = 10, previewer = false, }
            )
          )
        end,
        opt = {
          desc = '[/] Fuzzily search in current buffer',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>s/',
        rhs = function()
          builtin.live_grep({
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          })
        end,
        opt = {
          desc = '[S]earch [/] in Open Files',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>ss',
        rhs = builtin.builtin,
        opt = {
          desc = '[S]earch [S]elect Telescope',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>gf',
        rhs = builtin.git_files,
        opt = {
          desc = 'Search [G]it [F]iles',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sf',
        rhs = builtin.find_files,
        opt = {
          desc = '[S]earch [F]iles',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sh',
        rhs = builtin.help_tags,
        opt = {
          desc = '[S]earch [H]elp',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sn',
        rhs = function()
          builtin.find_files({ cwd = vim.fn.stdpath('config') })
        end,
        opt = {
          desc = '[S]earch [N]eovim Files',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sw',
        rhs = builtin.grep_string,
        opt = {
          desc = '[S]earch current [W]ord',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sg',
        rhs = builtin.live_grep,
        opt = {
          desc = '[S]earch by [G]rep',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sd',
        rhs = builtin.diagnostics,
        opt = {
          desc = '[S]earch [D]iagnostics',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sr',
        rhs = builtin.resume,
        opt = {
          desc = '[S]earch [R]esume',
        }
      },
      {
        mod = 'n',
        lhs = '<leader>sk',
        rhs = builtin.keymaps,
        opt = {
          desc = '[S]earch [K]eymaps',
        }
      },
      -- }}}
    })
  end
}
