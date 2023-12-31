return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-bibtex.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')
    local globals = require('mpbsd.core.opts.globals')
    telescope.setup(
      {
        defaults = {
          path_display = 'absolute',
          mappings = {
            -- i = {
            --   ['<c-j>'] = actions.move_selection_next,
            --   ['<c-k>'] = actions.move_selection_previous,
            --   ['<c-q>'] = actions.send_selected_to_qflist + actions.openqflist,
            -- },
          },
        },
        extensions = {
          ['bibtex'] = {
            global_files = { '~/.local/share/references/zotero.bib' },
          },
        },
      }
    )
    telescope.load_extension('bibtex')
    globals.vim_keymap_set(
      {
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
              themes.get_dropdown {
                winblend = 10,
                previewer = false,
              }
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
            builtin.live_grep(
              {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
              }
            )
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
          lhs = '<leader>sb',
          rhs = ':Telescope bibtex<cr>',
          opt = {
            desc = '[S]earch [B]ibliography',
          }
        },
      }
    )
  end
}
