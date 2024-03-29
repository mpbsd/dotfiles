return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'j-hui/fidget.nvim',
      opts = {}
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local globals = require('mpbsd.core.opts.globals')
    for server_name, server_settings in pairs(globals.language_servers) do
      lspconfig[server_name].setup({
        settings = server_settings.settings,
        on_attach = function()
          local telescope_builtin = require('telescope.builtin')
          globals.nvim_set_keymaps({ -- {{{
            {
              mod = 'n',
              lhs = '<leader>df',
              rhs = vim.diagnostic.open_float,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Show diagnostics in a floting window',
              }
            },
            {
              mod = 'n',
              lhs = '[d',
              rhs = vim.diagnostic.goto_prev,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Move to the previous diagnostic in the current buffer',
              }
            },
            {
              mod = 'n',
              lhs = ']d',
              rhs = vim.diagnostic.goto_next,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Move to the next diagnostic in the current buffer',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>ll',
              rhs = vim.diagnostic.setloclist,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Add buffer diagnostics to the location list',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>rn',
              rhs = vim.lsp.buf.rename,
              opt = {
                noremap = true,
                silent = true,
                desc = '[R]e[n]ame',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>ca',
              rhs = vim.lsp.buf.code_action,
              opt = {
                noremap = true,
                silent = true,
                desc = '[C]ode [A]ction',
              }
            },
            {
              mod = 'n',
              lhs = 'gd',
              rhs = telescope_builtin.lsp_definitions,
              opt = {
                noremap = true,
                silent = true,
                desc = '[G]oto [D]efinition',
              }
            },
            {
              mod = 'n',
              lhs = 'gr',
              rhs = telescope_builtin.lsp_references,
              opt = {
                noremap = true,
                silent = true,
                desc = '[G]oto [R]eferences',
              }
            },
            {
              mod = 'n',
              lhs = 'gI',
              rhs = telescope_builtin.lsp_implementations,
              opt = {
                noremap = true,
                silent = true,
                desc = '[G]oto [I]mplementation',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>D',
              rhs = telescope_builtin.lsp_type_definitions,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Type [D]efinition',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>ds',
              rhs = telescope_builtin.lsp_document_symbols,
              opt = {
                noremap = true,
                silent = true,
                desc = '[D]ocument [S]ymbols',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>ws',
              rhs = telescope_builtin.lsp_dynamic_workspace_symbols,
              opt = {
                noremap = true,
                silent = true,
                desc = '[W]orkspace [S]ymbols',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>hd',
              rhs = vim.lsp.buf.hover,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Hover Documentation',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>sd',
              rhs = vim.lsp.buf.signature_help,
              opt = {
                noremap = true,
                silent = true,
                desc = 'Signature Documentation',
              }
            },
            {
              mod = 'n',
              lhs = 'gD',
              rhs = vim.lsp.buf.declaration,
              opt = {
                noremap = true,
                silent = true,
                desc = '[G]oto [D]eclaration',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>wa',
              rhs = vim.lsp.buf.add_workspace_folder,
              opt = {
                noremap = true,
                silent = true,
                desc = '[W]orkspace [A]dd Folder',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>wr',
              rhs = vim.lsp.buf.remove_workspace_folder,
              opt = {
                noremap = true,
                silent = true,
                desc = '[W]orkspace [R]emove Folder',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>wl',
              rhs = function()
                print(
                  vim.inspect(vim.lsp.buf.list_workspace_folders())
                )
              end,
              opt = {
                noremap = true,
                silent = true,
                desc = '[W]orkspace [L]ist Folders',
              }
            },
            {
              mod = 'n',
              lhs = '<leader>fb',
              rhs = vim.lsp.buf.format,
              opt = {
                noremap = true,
                silent = true,
                desc = '[F]ormat current [B]uffer with LSP',
              }
            },
          }) -- }}}
        end,
        filetypes = server_settings.filetypes,
      })
    end
  end
}
