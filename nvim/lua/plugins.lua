local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'godlygeek/tabular'

Plug 'junegunn/goyo.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
Plug('dracula/vim', {as = 'dracula'})
Plug 'gruvbox-community/gruvbox'

Plug 'mpbsd/vim-ledgendary'

vim.call('plug#end')

vim.cmd('colorscheme dracula')
