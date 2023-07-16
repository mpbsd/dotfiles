#!/usr/bin/bash


declare -a TEXT_EDITORS=(
  vim-nox
  ed
  nvi
)


declare -a COMPILED_LANGUAGES=(
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
)


declare -a UTILS=(
  9base
  abook
  bat
  curl
  deborphan
  debsums
  fd-find
  fonts-spleen
  fzf
  gtypist
  htop
  hub
  ledger
  lf
  mutt
  neofetch
  newsboat
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
  zsh-doc
  zsh-syntax-highlighting
  zsh-autosuggestions
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


declare -a TILINGWM=(
  sway
  wev
  wofi
  wofi-pass
)


PKGS=("${TEXT_EDITORS[@]}" "${COMPILED_LANGUAGES[@]}" "${UTILS[@]}" "${LATEX[@]}" "${GUI[@]}" "${BUILD_REQUIREMENTS_NEOVIM[@]}" "${TILINGWM[@]}")


for PKG in ${PKGS[@]}
do
  if [ -n "$(dpkg -l | grep -F $PKG)" ]
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
