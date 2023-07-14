return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local nls = require("null-ls")
    nls.setup({
      sources = {
        -- Python
        nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.black.with({ extra_args = { "-l 79" } }),
        -- LaTeX
        nls.builtins.diagnostics.chktex,
        nls.builtins.formatting.latexindent,
      },
    })
  end
}
