local kmap = vim.keymap.set
local opts = { noremap = true }

kmap('i', 'jj', '<Esc>', opts)
kmap('n', '<Leader>;', ':', opts)

-- file commands
kmap('n', '<Leader>fw', ':write<CR>', opts)
kmap('n', '<Leader>fq', ':quit<CR>', opts)

-- edit config files
kmap('n', '<Leader>erc', ':edit $MYVIMRC<CR>', opts)
kmap('n', '<Leader>src', ':source $MYVIMRC<CR>', opts)

kmap('n', '<Leader>eop', ':edit ~/.config/nvim/lua/options.lua<CR>', opts)
kmap('n', '<Leader>ekm', ':edit ~/.config/nvim/lua/keymaps.lua<CR>', opts)
kmap('n', '<Leader>epg', ':edit ~/.config/nvim/lua/plugins.lua<CR>', opts)

-- window navigation
kmap('n', '<C-h>', '<C-w>h', opts)
kmap('n', '<C-j>', '<C-w>j', opts)
kmap('n', '<C-k>', '<C-w>k', opts)
kmap('n', '<C-l>', '<C-w>l', opts)
