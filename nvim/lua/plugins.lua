local packer = require 'packer'

return packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    use 'godlygeek/tabular'
    use 'junegunn/goyo.vim'
    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'sirver/ultisnips'
    use 'tpope/vim-abolish'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-vinegar'
    use 'vimwiki/vimwiki'
    use 'wellle/targets.vim'
    use 'gruvbox-community/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'mpbsd/vim-ledgendary'
  end
)
