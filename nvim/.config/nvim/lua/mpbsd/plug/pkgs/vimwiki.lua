return {
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
