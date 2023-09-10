#!/usr/bin/bash
#
# author: marcelo barboza <salve.barboza@pm.me>
# date: 2023-09-07

# {{{ TEXT_EDITORS
declare -a TEXT_EDITORS=(
  vim-nox
  vim-gtk3
  nvi
)
# }}}
# {{{ DEVELOPMENT
declare -a DEVELOPMENT=(
  build-essential
  gdb
  glibc-doc
  universal-ctags
  valgrind
)
# }}}
# {{{ PYTHON_DEVELOPMENT
declare -a PYTHON_DEVELOPMENT=(
  python3-venv
  python3-pip
)
# }}}
# {{{ DATABASE
declare -a DATABASE=(
  postgresql
  postgresql-client
  sqlite3
  sqlite3-doc
)
# }}}
# {{{ MAIL_CHAT_AND_NEWS
declare -a MAIL_CHAT_AND_NEWS=(
  abook
  mutt
  w3m
  irssi
  newsboat
)
# }}}
# {{{ SYSTEM_MAINTENANCE
declare -a SYSTEM_MAINTENANCE=(
  aptitude
  deborphan
  debsums
  stow
)
# }}}
# {{{ FUN_AND_GAMES
declare -a FUN_AND_GAMES=(
  bsdgames
  cowsay
  fortunes
)
# }}}
# {{{ SECURITY
declare -a SECURITY=(
  pass
  pass-otp
  keychain
)
# }}}
# {{{ BLOGGING
declare -a BLOGGING=(
  lowdown
  hugo
)
# }}}
# {{{ UTILS
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
# }}}
# {{{ SHELL
declare -a SHELL=(
  zsh
  zsh-autosuggestions
  zsh-doc
  zsh-syntax-highlighting
)
# }}}
# {{{ TERMINAL_CLIENTS
declare -a TERMINAL_CLIENTS=(
  alacritty
)
# }}}
# {{{ LATEX
declare -a LATEX=(
  texlive-full
  zathura
)
# }}}
# {{{ IMAGE
declare -a IMAGE=(
  inkscape
)
# }}}
# {{{ BROWSER
declare -a BROWSER=(
  chromium
  chromium-driver
)
# }}}
# {{{ NEOVIM_BUILD_REQUIREMENTS
declare -a NEOVIM_BUILD_REQUIREMENTS=(
  ninja-build
  gettext
  cmake
  unzip
  curl
  ccache
)
# }}}
# {{{ AWESOME
# declare -a AWESOME=(
#   awesome
#   picom
#   conky
# )
# }}}
# {{{ SWAY
declare -a SWAY=(
  sway
  waybar
  swayidle
  swaylock
  wev
  wofi
  wofi-pass
)
# }}}
# {{{ ZSA_WALLY
declare -a ZSA_WALLY=(
  libusb-1.0-0-dev:amd64
)
# }}}

# {{{ package list
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
  "${NEOVIM_BUILD_REQUIREMENTS[@]}"
  "${SWAY[@]}"
  "${ZSA_WALLY[@]}"
)
# }}}

# {{{ loop through packages
for PKG in ${PKGS[@]}
do
  if [ -n "$(dpkg -l | sed -n "/^ii\s\+\<${PKG}\>\s/p")" ]
  then
    echo "Found: ${PKG}"
  else
    echo "Package ${PKG} not found. Would you like to install it? (y/N)"
    read ANSWER
    if [ "${ANSWER}" = 'y' ]
    then
      echo 'Proceeding with package installation.'
      if [ "${PKG}" = 'libusb-1.0-0-dev' ]
      then
        sudo apt install libusb-1.0-0-dev
      else
        sudo apt install -y $PKG
      fi
      echo 'Done.'
    fi
  fi
done
# }}}

exit 0

# vim: set foldmethod=marker #
