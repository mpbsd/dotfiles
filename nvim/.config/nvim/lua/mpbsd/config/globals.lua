-- Function ON_ATTACH adds keybindings to Neovim when LSP attachs to buffers
ON_ATTACH = function()
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
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
  vim.keymap.set("n", "td", vim.lsp.buf.type_definition, { desc = "[T]ype [D]efinition" })
  -- documentation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
  -- workspace
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "[W]orkspace [L]ist Folders" })
  vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
  vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
end

-- Testing
function P(v)
  print(vim.inspect(v))
  return v
end

-- vim: ts=2 sw=2 et
