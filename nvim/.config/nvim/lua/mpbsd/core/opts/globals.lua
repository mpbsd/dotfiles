local M = {}

M.vim_keymap_set = function(mappings_table)
  for _, mapping in pairs(mappings_table) do
    local mod = mapping['mod']
    local lhs = mapping['lhs']
    local rhs = mapping['rhs']
    local opt = mapping['opt']
    vim.keymap.set(mod, lhs, rhs, opt)
  end
end

M.vim_create_autocmd = function(autocmds_table)
  for _, autocmd in pairs(autocmds_table) do
    local evt = autocmd['evt']
    local ptn = autocmd['ptn']
    local cmd = autocmd['cmd']
    local grp = autocmd['grp']
    vim.api.nvim_create_autocmd(
      evt,
      {
        pattern = ptn,
        command = cmd,
        group = vim.api.nvim_create_augroup(grp, { clear = true })
      }
    )
  end
end

M.language_servers = {
  -- servers {{{
  bashls = {
    filetypes = { 'sh' },
    settings = {},
  },
  clangd = {
    filetypes = { 'c', 'h' },
    settings = {},
  },
  lua_ls = {
    filetypes = { 'lua' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          disable = { 'missing-field', 'undefined-field' },
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  pylsp = {
    filetypes = { 'python' },
    settings = {},
  },
  texlab = {
    filetypes = { 'plaintex', 'bib' },
    settings = {},
  },
  vimls = {
    filetypes = { 'vim' },
    settings = {},
  },
  -- }}}
}

M.on_attach = function()
  local telescope_builtin = require('telescope.builtin')
  M.vim_keymap_set({
    -- keymaps {{{
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
    -- }}}
  })
end

if vim.fn.has('nvim-0.9.5') then
  M.vim_uv = vim.loop
else
  M.vim_uv = vim.uv
end

return M
