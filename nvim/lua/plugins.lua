local kmap = vim.keymap.set
local opts = { noremap = true }
local Plug = vim.fn['plug#']

-- manage plugins with junegunn's vim-plug

vim.call('plug#begin')

Plug 'godlygeek/tabular'

Plug 'junegunn/goyo.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

Plug 'sirver/ultisnips'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'vimwiki/vimwiki'

Plug 'wellle/targets.vim'

Plug 'vim-airline/vim-airline'
Plug('dracula/vim', { as = 'dracula' })
Plug 'gruvbox-community/gruvbox'

Plug 'mpbsd/vim-ledgendary'

vim.call('plug#end')

-- plugin's settings

vim.cmd [[colorscheme dracula]]

vim.g.airline_symbols_ascii = 1

vim.g.UltiSnipsSnippetDirectories  = { "~/.vim/UltiSnips" }
vim.g.UltiSnipsExpandTrigger       = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger  = '<C-j>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-k>'
vim.g.UltiSnipsEditSplit           = 'horizontal'

vim.g.vimwiki_list = {{ path = '~/projects/vimwiki' }}

-- -- telescope
kmap('n', '<Leader>ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
kmap('n', '<Leader>fg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
kmap('n', '<Leader>fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
kmap('n', '<Leader>fh', "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

-- treesitter
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "latex", "lua", "markdown", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for
    -- example if you want to disable highlighting for the `tex` filetype, you
    -- need to include `latex` in this list as this is the name of the parser)
    -- list of language that will be disabled
    disable = { "javscript" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same
    -- time. Set this to `true` if you depend on 'syntax' being enabled (like
    -- for indentation). Using this option may slow down your editor, and you
    -- may see some duplicate highlights. Instead of true it can also be a list
    -- of languages
    additional_vim_regex_highlighting = false,
  },
}
