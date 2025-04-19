" secure mode for reading vimrc in current dir
set secure

" encoding used internally
set encoding=utf-8

" columns to highlight
set colorcolumn=80

" highlight the screen column of the cursor
set cursorcolumn

" highlight the screen line of the cursor
set cursorline

" comma-separated list of settings for how cursorline is displayed
set cursorlineopt=line

" print the line number in front of each line
set number

" number of columns used for the line number
set numberwidth=6

" show relative line number in front of each line
set relativenumber

" number of spaces that <Tab> in file counts for
set tabstop=2

" number of spaces to use for (auto)indent step
set shiftwidth=2

" use spaces when <Tab> is inserted
set expandtab

" take indent for new line from previous line
set autoindent

" do smart autoindenting when starting a new line
set smartindent

" changes special characters in search patterns
set magic

" ignore case in search patterns
set ignorecase

" let upper case letters inhibit the ignorecase option
set smartcase

" when there is a previous search pattern, highlight all its matches
set hlsearch

" highlight match while typing search pattern
set incsearch

" characters to use for displaying special items
set fillchars=fold:·,foldsep:│,vert:│

" useful to see the difference between tabs and spaces and for trailing blanks
set list

" characters for displaying in list mode
set listchars=eol:↴,extends:>,lead:.,multispace:.,nbsp:+,precedes:<,tab:│\ \,trail:~

" This option helps to avoid all the hit-enter prompts caused by file
" messages, for example with CTRL-G, and to avoid some other messages
set shortmess=filnxtToOSI

" don't show (partial) command in the last line of the screen
set noshowcmd

" don't show the mode() on the last line
set noshowmode

" don't insert two spaces after a period with a join command
set nojoinspaces

" how automatic formatting is to be done
set formatoptions=tcqj

" languages to do spell checking for
set spelllang=en_us,pt_br,de_de

" methods used to suggest spelling corrections
set spellsuggest=fast,20

" new window from split is below the current one
set splitbelow

" new window is put right of the current one
set splitright

" save undo information in a file
set undofile

" don't unload buffer when it is abandoned
set hidden

" don't redraw while executing macros
set lazyredraw

" don't invoke fsync() after file write
set nofsync

" a list of words that change how cmdline-completion is done
set wildoptions=pum,tagfile

" adjusts the default color groups for that background type
set background=dark

" graphical user interface
if has("gui_running")
  set guioptions-=T
  set guioptions-=b
  set guioptions+=d
  set guioptions-=l
  set guioptions-=m
  set guioptions-=r
  set guifont=JetBrainsMono\ Nerd\ Font\ 14
  set guiheadroom=0
endif
