return {
  'vimwiki/vimwiki',
  init = function()
    local wiki_1 = {
      path = '~/.local/share/vimwiki/',
      index = 'index',
      syntax = 'default',
      ext = '.wiki',
    }
    vim.g.vimwiki_list = { wiki_1 }
  end
}
