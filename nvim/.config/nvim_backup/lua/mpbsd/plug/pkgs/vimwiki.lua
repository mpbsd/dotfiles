return {
  'vimwiki/vimwiki',
  init = function()
    local wiki1 = {
      path = '~/.local/share/vimwiki/wiki1/',
      index = 'index',
      syntax = 'default',
      ext = '.wiki',
    }
    local wiki2 = {
      path = '~/.local/share/vimwiki/wiki2/',
      index = 'index',
      syntax = 'default',
      ext = '.wiki',
    }
    vim.g.vimwiki_list = { wiki1, wiki2 }
  end
}
