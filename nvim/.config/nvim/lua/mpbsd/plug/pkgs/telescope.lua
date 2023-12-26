return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")
    -- local find_git_root = function()
    --   -- Use the current buffer's path as the starting point for the git search
    --   local current_file = vim.api.nvim_buf_get_name(0)
    --   local cwd = vim.fn.getcwd()
    --   local current_dir
    --   -- If the buffer is not associated with a file, return nil
    --   if current_file == "" then
    --     current_dir = cwd
    --   else
    --     -- Extract the directory from the current file's path
    --     current_dir = vim.fn.fnamemodify(current_file, ":h")
    --   end
    --   -- Find the Git root directory from the current file's path
    --   local git_root = vim.fn.systemlist(
    --     "git -C "
    --     ..
    --     vim.fn.escape(current_dir, " ")
    --     ..
    --     " rev-parse --show-toplevel"
    --   )[1]
    --   if vim.v.shell_error ~= 0 then
    --     print "Not a git repository. Searching on current working directory"
    --     return cwd
    --   end
    --   return git_root
    -- end
    -- local live_grep_git_root = function()
    --   local git_root = find_git_root()
    --   if git_root then
    --     require("telescope.builtin").live_grep({
    --       search_dirs = { git_root },
    --     })
    --   end
    -- end
    -- vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
    local telescope_live_grep_open_files = function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end
    -- local actions = require("telescope.actions")
    -- local defaults = {
    --   mappings = {
    --     i = {
    --       ["<c-j>"] = actions.move_selection_next,
    --       ["<c-k>"] = actions.move_selection_previous,
    --       ["<c-q>"] = actions.send_selected_to_qflist + actions.openqflist,
    --     },
    --   },
    -- }
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
      -- {
      --   mod = "n",
      --   lhs = "<leader>sG",
      --   rhs = ":LiveGrepGitRoot<cr>",
      --   opt = {
      --     desc = "[S]earch by [G]rep on Git Root",
      --   }
      -- },
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
    })
  end
}
