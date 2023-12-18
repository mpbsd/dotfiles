let s:options = [
      \"number",
      \"relativenumber",
      \"numberwidth=6",
      \"cursorline",
      \"cursorcolumn",
      \"colorcolumn=80",
      \"tabstop=2",
      \"shiftwidth=2",
      \"expandtab",
      \"autoindent",
      \"smartindent",
      \"linebreak",
      \"nolist",
      \"nojoinspaces",
      \"splitright",
      \"splitbelow",
      \"ignorecase",
      \"smartcase",
      \"magic",
      \"lazyredraw",
      \"encoding=utf8",
      \"secure",
      \"hidden",
      \"undofile",
      \]


for option in s:options
  let s:cmd = "set " . option
  sil exe s:cmd
endfor


runtime ftplugin/man.vim
