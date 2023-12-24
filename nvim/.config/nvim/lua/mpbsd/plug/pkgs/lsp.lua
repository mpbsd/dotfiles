return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      opts = {}
    },
  },
  config = function()
    require("mason").setup({
      -- The directory in which to install packages.
      install_root_dir = vim.fn.stdpath("data") .. "/mason",
      -- Where Mason should put its bin location in your PATH. Can be one of:
      -- - "prepend" (default, Mason"s bin location is put first in PATH)
      -- - "append" (Mason"s bin location is put at the end of PATH)
      -- - "skip" (doesn"t modify PATH)
      -- - @type ""prepend"" | ""append"" | ""skip""
      PATH = "prepend",
      -- Controls to which degree logs are written to the log file. It"s useful to set this to vim.log.levels.DEBUG when
      -- debugging issues with package installations.
      log_level = vim.log.levels.INFO,
      -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
      -- packages that are requested to be installed will be put in a queue.
      max_concurrent_installers = 4,
      -- [Advanced setting]
      -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
      -- multiple registries, the registry listed first will be used.
      registries = {
        "github:mason-org/mason-registry",
      },
      -- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
      -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
      -- Builtin providers are:
      --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
      --   - mason.providers.client        - uses only client-side tooling to resolve metadata
      providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
      },
      github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
      },
      pip = {
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = false,
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
      },
      ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",
        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,
        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.9,
        icons = {
          -- The list icon to use for installed packages.
          package_installed = "◍",
          -- The list icon to use for packages that are installing, or queued for installation.
          package_pending = "◍",
          -- The list icon to use for packages that are not installed.
          package_uninstalled = "◍",
        },
        keymaps = {
          -- Keymap to expand a package
          toggle_package_expand = "<CR>",
          -- Keymap to install the package under the current cursor position
          install_package = "i",
          -- Keymap to reinstall/update the package under the current cursor position
          update_package = "u",
          -- Keymap to check for new version for the package under the current cursor position
          check_package_version = "c",
          -- Keymap to update all installed packages
          update_all_packages = "U",
          -- Keymap to check which installed packages are outdated
          check_outdated_packages = "C",
          -- Keymap to uninstall a package
          uninstall_package = "X",
          -- Keymap to cancel a package installation
          cancel_installation = "<C-c>",
          -- Keymap to apply language filter
          apply_language_filter = "<C-f>",
        },
      },
    })
    local mason_lspconfig = require("mason-lspconfig")
    local servers = {
      -- LSP servers
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
    }
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers)
    })
    -- local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    -- Function ON_ATTACH adds keybindings to Neovim when LSP attachs to buffers
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities),
          on_attach = function(_, bufnr)
            local telescope_builtin = require("telescope.builtin")
            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(
              bufnr,
              "Format",
              function(_)
                vim.lsp.buf.format()
              end,
              {
                desc = "Format current buffer with LSP"
              }
            )
            Keymap({
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
              -- Lesser used LSP functionality
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
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                opt = {
                  desc = "[W]orkspace [L]ist Folders",
                }
              },
              {
                mod = "n",
                lhs = "<leader>fb",
                rhs = ":Format<cr>",
                opt = {
                  desc = "[F]ormat current [B]uffer with LSP",
                }
              },
            })
          end,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end
    })
  end
}
