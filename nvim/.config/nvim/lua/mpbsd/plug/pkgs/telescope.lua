return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-bibtex.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          -- i = {
          --   ["<c-j>"] = actions.move_selection_next,
          --   ["<c-k>"] = actions.move_selection_previous,
          --   ["<c-q>"] = actions.send_selected_to_qflist + actions.openqflist,
          -- },
        },
      },
      extensions = {
        bibtex = {
          -- Depth for the *.bib file
          depth = 1,
          -- Custom format for citation label
          custom_formats = {},
          -- Format to use for citation label.
          -- Try to match the filetype by default, or use 'plain'
          format = "",
          -- Path to global bibliographies (placed outside of the project)
          global_files = { "~/.local/share/references/zotero.bib" },
          -- Define the search keys to use in the picker
          search_keys = { "author", "year", "title" },
          -- Template for the formatted citation
          citation_format = "{{author}} ({{year}}), {{title}}.",
          -- Only use initials for the authors first name
          citation_trim_firstname = true,
          -- Max number of authors to write in the formatted citation
          -- following authors will be replaced by "et al."
          citation_max_auth = 2,
          -- Context awareness disabled by default
          context = false,
          -- Fallback to global/directory .bib files if context not found
          -- This setting has no effect if context = false
          context_fallback = true,
          -- Wrapping in the preview window is disabled by default
          wrap = false,
        },
      },
    })
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")
    telescope.load_extension("bibtex")
    local telescope_live_grep_open_files = function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end
    KeymapSet({
      {
        mod = "n",
        lhs = "<leader>?",
        rhs = builtin.oldfiles,
        opt = {
          desc = "[?] Find recently opened files",
        }
      },
      {
        mod = "n",
        lhs = "<leader>,",
        rhs = builtin.buffers,
        opt = {
          desc = "[,] Find existing buffers",
        }
      },
      {
        mod = "n",
        lhs = "<leader>/",
        rhs = function()
          builtin.current_buffer_fuzzy_find(
            themes.get_dropdown {
              winblend = 10,
              previewer = false,
            }
          )
        end,
        opt = {
          desc = "[/] Fuzzily search in current buffer",
        }
      },
      {
        mod = "n",
        lhs = "<leader>s/",
        rhs = telescope_live_grep_open_files,
        opt = {
          desc = "[S]earch [/] in Open Files",
        }
      },
      {
        mod = "n",
        lhs = "<leader>ss",
        rhs = builtin.builtin,
        opt = {
          desc = "[S]earch [S]elect Telescope",
        }
      },
      {
        mod = "n",
        lhs = "<leader>gf",
        rhs = builtin.git_files,
        opt = {
          desc = "Search [G]it [F]iles",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sf",
        rhs = builtin.find_files,
        opt = {
          desc = "[S]earch [F]iles",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sh",
        rhs = builtin.help_tags,
        opt = {
          desc = "[S]earch [H]elp",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sw",
        rhs = builtin.grep_string,
        opt = {
          desc = "[S]earch current [W]ord",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sg",
        rhs = builtin.live_grep,
        opt = {
          desc = "[S]earch by [G]rep",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sd",
        rhs = builtin.diagnostics,
        opt = {
          desc = "[S]earch [D]iagnostics",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sr",
        rhs = builtin.resume,
        opt = {
          desc = "[S]earch [R]esume",
        }
      },
      {
        mod = "n",
        lhs = "<leader>sb",
        rhs = ":Telescope bibtex<cr>",
        opt = {
          desc = "[S]earch [B]ibliography",
        }
      },
    })
  end
}
