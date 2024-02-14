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
        on_attach = globals.on_attach,
        filetypes = server_settings.filetypes,
      })
    end
  end
}
