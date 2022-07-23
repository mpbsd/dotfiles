local kmap = vim.keymap.set
local opts = { noremap = true }
local Plug = vim.fn['plug#']

-- manage plugins with junegunn's vim-plug

vim.call('plug#begin')

Plug 'godlygeek/tabular'

Plug 'junegunn/goyo.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

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

vim.cmd[[colorscheme dracula]]

vim.g.airline_symbols_ascii = 1

vim.g.UltiSnipsSnippetDirectories  = { "~/.vim/UltiSnips" }
vim.g.UltiSnipsExpandTrigger       = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger  = '<C-j>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-k>'
vim.g.UltiSnipsEditSplit           = 'horizontal'

vim.g.vimwiki_list = {{ path = '~/projects/vimwiki' }}
-- telescope
kmap('n', '<Leader>ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
kmap('n', '<Leader>fg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
kmap('n', '<Leader>fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
kmap('n', '<Leader>fh', "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
