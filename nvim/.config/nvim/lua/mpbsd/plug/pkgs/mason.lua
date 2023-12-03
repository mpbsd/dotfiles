return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      -- The directory in which to install packages.
      install_root_dir = vim.fn.stdpath("data") .. "/mason",
      -- Where Mason should put its bin location in your PATH. Can be one of:
      -- - "prepend" (default, Mason's bin location is put first in PATH)
      -- - "append" (Mason's bin location is put at the end of PATH)
      -- - "skip" (doesn't modify PATH)
      ---@type '"prepend"' | '"append"' | '"skip"'
      PATH = "prepend",
      -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
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
    local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    -- Function ON_ATTACH adds keybindings to Neovim when LSP attachs to buffers
    local ON_ATTACH = function()
      local telescope_builtin = require("telescope.builtin")
      -- diagnostics
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
      -- action
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
      -- goto
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
      vim.keymap.set("n", "td", vim.lsp.buf.type_definition, { desc = "[T]ype [D]efinition" })
      -- documentation
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
      -- workspace
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
      vim.keymap.set(
        "n",
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        { desc = "[W]orkspace [L]ist Folders" }
      )
      vim.keymap.set("n", "<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols,
        { desc = "[W]orkspace [S]ymbols" })
      vim.keymap.set("n", "<leader>ds", telescope_builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
      -- format
      vim.keymap.set(
        "n",
        "<leader>fc",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        { desc = "[F]ormat [C]ode" }
      )
    end
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities),
          on_attach = ON_ATTACH,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end
    })
  end
}
