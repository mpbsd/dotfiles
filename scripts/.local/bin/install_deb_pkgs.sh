#!/usr/bin/bash


declare -a TEXT_EDITORS=(
  vim-nox
  vim-gtk3
  nvi
)


declare -a DEVELOPMENT=(
  build-essential
  gdb
  glibc-doc
  universal-ctags
  valgrind
)


declare -a PYTHON_DEVELOPMENT=(
  python3-venv
  python3-pip
)


declare -a DATABASE=(
  postgresql
  postgresql-client
  sqlite3
  sqlite3-doc
)


declare -a MAIL_CHAT_AND_NEWS=(
  abook
  mutt
  w3m
  irssi
  newsboat
)


declare -a SYSTEM_MAINTENANCE=(
  aptitude
  deborphan
  debsums
  stow
)


declare -a FUN_AND_GAMES=(
  bsdgames
  cowsay
  fortune
)


declare -a SECURITY=(
  pass
  pass-otp
  keychain
)

declare -a BLOGGING=(
  lowdown
  hugo
)


declare -a UTILS=(
  9base
  bat
  curl
  fd-find
  fzf
  gtypist
  hub
  ledger
  lf
  plocate
  qpdf
  ripgrep
  sdcv
  silversearcher-ag
  tmux
)


declare -a SHELL=(
  zsh
  zsh-autosuggestions
  zsh-doc
  zsh-syntax-highlighting
)


declare -a TERMINAL_CLIENTS=(
  alacritty
)


declare -a LATEX=(
  texlive-full
  zathura
)


declare -a IMAGE=(
  inkscape
)


declare -a BROWSER=(
  chromium
  chromium-driver
)


# declare -a NEOVIM_BUILD_REQUIREMENTS=(
#   ninja-build
#   gettext
#   cmake
#   unzip
#   curl
#   ccache
# )


# declare -a AWESOME=(
#   awesome
#   picom
#   conky
# )


declare -a SWAY=(
  sway
  waybar
  swayidle
  swaylock
  wev
  wofi
  wofi-pass
)


declare -a ZSA_WALLY=(
  libusb-1.0-0-dev
)


PKGS=(
  "${TEXT_EDITORS[@]}"
  "${DEVELOPMENT[@]}"
  "${PYTHON_DEVELOPMENT[@]}"
  "${DATABASE[@]}"
  "${MAIL_CHAT_AND_NEWS[@]}"
  "${SYSTEM_MAINTENANCE[@]}"
  "${FUN_AND_GAMES[@]}"
  "${SECURITY[@]}"
  "${BLOGGING[@]}"
  "${UTILS[@]}"
  "${SHELL[@]}"
  "${TERMINAL_CLIENTS[@]}"
  "${LATEX[@]}"
  "${IMAGE[@]}"
  "${BROWSER[@]}"
  "${SWAY[@]}"
  "${ZSA_WALLY[@]}"
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
