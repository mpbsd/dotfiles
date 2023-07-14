return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { noremap = true, silent = true })
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
        { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
        { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, buffer = bufnr })
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end,
        { noremap = true, silent = true, buffer = bufnr })
    end
    local lsp_flags = {
      debounce_text_changes = 150,
    }
    require("lspconfig")["clangd"].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    }
    require("lspconfig")["lua_ls"].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = {
              "vim",
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
    require("lspconfig")["pyright"].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    }
    require("lspconfig")["rust_analyzer"].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {}
    }
    require("lspconfig")["texlab"].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = false
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = true
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = true
        }
      }
    }
  end
}
