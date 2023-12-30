return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
    },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup(
      {
        install_root_dir = vim.fn.stdpath("data") .. "/mason",
        PATH = "prepend",
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
        registries = {
          "github:mason-org/mason-registry",
        },
        providers = {
          "mason.providers.registry-api",
          "mason.providers.client",
        },
        github = {
          download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },
        pip = {
          upgrade_pip = false,
          install_args = {},
        },
        ui = {
          check_outdated_packages_on_open = true,
          border = "none",
          width = 0.8,
          height = 0.9,
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
          keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
          },
        },
      }
    )
    local servers = {
      bashls = {},
      clangd = {},
      lua_ls = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
      pylsp = {},
      texlab = {},
      vimls = {},
    }
    mason_lspconfig.setup(
      {
        ensure_installed = vim.tbl_keys(servers)
      }
    )
    mason_lspconfig.setup_handlers(
      {
        function(server_name)
          require("lspconfig")[server_name].setup(
            {
              on_attach = function()
                local telescope_builtin = require("telescope.builtin")
                local globals = require("mpbsd.core.opts.globals")
                globals.vim_keymap_set(
                  {
                    {
                      mod = "n",
                      lhs = "<leader>df",
                      rhs = vim.diagnostic.open_float,
                      opt = {
                        desc = "Show diagnostics in a floting window",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "[d",
                      rhs = vim.diagnostic.goto_prev,
                      opt = {
                        desc = "Move to the previous diagnostic in the current buffer",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "]d",
                      rhs = vim.diagnostic.goto_next,
                      opt = {
                        desc = "Move to the next diagnostic in the current buffer",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>ll",
                      rhs = vim.diagnostic.setloclist,
                      opt = {
                        desc = "Add buffer diagnostics to the location list",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>rn",
                      rhs = vim.lsp.buf.rename,
                      opt = {
                        desc = "[R]e[n]ame",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>ca",
                      rhs = vim.lsp.buf.code_action,
                      opt = {
                        desc = "[C]ode [A]ction",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "gd",
                      rhs = telescope_builtin.lsp_definitions,
                      opt = {
                        desc = "[G]oto [D]efinition",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "gr",
                      rhs = telescope_builtin.lsp_references,
                      opt = {
                        desc = "[G]oto [R]eferences",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "gI",
                      rhs = telescope_builtin.lsp_implementations,
                      opt = {
                        desc = "[G]oto [I]mplementation",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>D",
                      rhs = telescope_builtin.lsp_type_definitions,
                      opt = {
                        desc = "Type [D]efinition",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>ds",
                      rhs = telescope_builtin.lsp_document_symbols,
                      opt = {
                        desc = "[D]ocument [S]ymbols",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>ws",
                      rhs = telescope_builtin.lsp_dynamic_workspace_symbols,
                      opt = {
                        desc = "[W]orkspace [S]ymbols",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>hd",
                      rhs = vim.lsp.buf.hover,
                      opt = {
                        desc = "Hover Documentation",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>sd",
                      rhs = vim.lsp.buf.signature_help,
                      opt = {
                        desc = "Signature Documentation",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "gD",
                      rhs = vim.lsp.buf.declaration,
                      opt = {
                        desc = "[G]oto [D]eclaration",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>wa",
                      rhs = vim.lsp.buf.add_workspace_folder,
                      opt = {
                        desc = "[W]orkspace [A]dd Folder",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>wr",
                      rhs = vim.lsp.buf.remove_workspace_folder,
                      opt = {
                        desc = "[W]orkspace [R]emove Folder",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>wl",
                      rhs = function()
                        print(
                          vim.inspect(vim.lsp.buf.list_workspace_folders())
                        )
                      end,
                      opt = {
                        desc = "[W]orkspace [L]ist Folders",
                      }
                    },
                    {
                      mod = "n",
                      lhs = "<leader>fb",
                      rhs = vim.lsp.buf.format,
                      opt = {
                        desc = "[F]ormat current [B]uffer with LSP",
                      }
                    },
                  }
                )
              end,
              settings = servers[server_name],
              filetypes = (servers[server_name] or {}).filetypes,
            }
          )
        end
      }
    )
  end
}
