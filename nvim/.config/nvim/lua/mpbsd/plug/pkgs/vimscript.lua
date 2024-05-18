return {
  'godlygeek/tabular',
  'tpope/vim-characterize',
  'tpope/vim-commentary',
  'tpope/vim-dadbod',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  {
    'vimwiki/vimwiki',
    init = function()
      local wiki1 = {
        path = '~/.local/share/vimwiki/wiki1/',
        index = 'index',
        syntax = 'default',
        ext = '.wiki',
      }
      vim.g.vimwiki_list = { wiki1 }
    end
  }
}
