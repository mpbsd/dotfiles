#!/usr/bin/bash


declare -a TEXT_EDITORS=(
  vim-nox
  vim-gtk3
  ed
  nvi
)


declare -a DEVELOPMENT=(
  glibc-doc
  build-essential
  gdb
  valgrind
  universal-ctags
  postgresql
  postgresql-client
  python3-venv
  nodejs
  npm
  sqlite3
  sqlite3-doc
)


declare -a UTILS=(
  9base
  abook
  alacritty
  aptitude
  bat
  bsdgames
  cowsay
  curl
  deborphan
  debsums
  fd-find
  flatpak
  fonts-spleen
  fortune
  fzf
  gtypist
  htop
  hub
  irssi
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
)


declare -a BUILD_REQUIREMENTS_NEOVIM=(
  ninja-build
  gettext
  cmake
  unzip
  curl
  ccache
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


declare -a FLATPAK=(
  com.brave.Browser
  com.spotify.Client
)


PKGS=(
  "${TEXT_EDITORS[@]}"
  "${DEVELOPMENT[@]}"
  "${UTILS[@]}"
  "${LATEX[@]}"
  "${GUI[@]}"
  "${BUILD_REQUIREMENTS_NEOVIM[@]}"
  "${SWAYWM[@]}"
)


for PKG in ${PKGS[@]}
do
  if [ -n "$(dpkg -l | grep -E "\<${PKG}")" ]
  then
    echo "Found: $PKG"
  else
    echo "Package ${PKG} not found. Would you like to install it? (y/N)"
    read ANSWER
    if [ "$ANSWER" = 'y' ]
    then
      echo 'Proceeding with package installation.'
      sudo apt install -y $PKG
      if [ "$PKG" = 'flatpak' ]
      then
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      fi
      echo 'Done.'
    fi
  fi
done


for PKG in ${FLATPAK[@]}
do
  if [ -n "$(flatpak list | grep -E "\<${PKG}")" ]
  then
    echo "Found: $PKG"
  else
    echo "Flatpak package ${PKG} not found. Would you like to install it? (y/N)"
    read ANSWER
    if [ "$ANSWER" = 'y' ]
    then
      sudo flatpak install $PKG
    fi
    echo 'Done.'
  fi
done


exit 0
