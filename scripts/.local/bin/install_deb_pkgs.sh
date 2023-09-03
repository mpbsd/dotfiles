#!/usr/bin/bash


declare -a TEXT_EDITORS=(
  vim-nox
  vim-gtk3
  ed
  nvi
)


declare -a DEVELOPMENT=(
  build-essential
  cscope
  gdb
  glibc-doc
  nodejs
  npm
  postgresql
  postgresql-client
  python3-venv
  ruby-full
  zlib1g-dev
  sqlite3
  sqlite3-doc
  universal-ctags
  valgrind
)


declare -a UTILS=(
  9base
  abook
  aptitude
  bat
  bsdgames
  cowsay
  curl
  deborphan
  debsums
  fd-find
  fonts-spleen
  fortune
  fzf
  gtypist
  htop
  hub
  irssi
  keychain
  ledger
  lf
  lowdown
  mutt
  neofetch
  newsboat
  pandoc
  pass
  pass-otp
  plocate
  qpdf
  ripgrep
  sdcv
  signify-openbsd
  signify-openbsd-keys
  silversearcher-ag
  stow
  tmux
  w3m
  zathura
  zsh
  zsh-autosuggestions
  zsh-doc
  zsh-syntax-highlighting
)


declare -a TERMINAL_CLIENTS=(
  alacritty
  kitty
)


declare -a LATEX=(
  texlive-full
  kile
  kbibtex
)


declare -a GUI=(
  inkscape
  blender
  chromium
  chromium-driver
  xournalpp
)


declare -a BUILD_REQUIREMENTS_NEOVIM=(
  ninja-build
  gettext
  cmake
  unzip
  curl
  ccache
)


declare -a AWESOMEWM=(
  awesome
  picom
  conky
)


declare -a SWAYWM=(
  sway
  waybar
  swayidle
  swaylock
  wev
  wofi
  wofi-pass
)


PKGS=(
  "${TEXT_EDITORS[@]}"
  "${DEVELOPMENT[@]}"
  "${UTILS[@]}"
  "${TERMINAL_CLIENTS[@]}"
  "${LATEX[@]}"
  "${GUI[@]}"
  "${BUILD_REQUIREMENTS_NEOVIM[@]}"
  "${AWESOMEWM[@]}"
  "${SWAYWM[@]}"
)


for PKG in ${PKGS[@]}
do
  if [ -n "$(dpkg -l | sed -n "/^ii\s\+\<${PKG}\>/p")" ]
  then
    echo "Found: $PKG"
  else
    echo "Package ${PKG} not found. Would you like to install it? (y/N)"
    read ANSWER
    if [ "$ANSWER" = 'y' ]
    then
      echo 'Proceeding with package installation.'
      sudo apt install -y $PKG
      echo 'Done.'
    fi
  fi
done


exit 0
