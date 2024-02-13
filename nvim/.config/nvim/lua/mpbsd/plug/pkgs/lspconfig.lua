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
      lspconfig[server_name].setup(server_settings)
    end

    vim.api.nvim_create_autocmd(
      'LspAttach',
      {
        callback = globals.on_attach,
        group = vim.api.nvim_create_augroup('LspConfig', { clear = true })
      }
    )

  end
}
