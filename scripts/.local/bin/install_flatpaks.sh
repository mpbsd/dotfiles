#!/usr/bin/bash


if [ -n "$(dpkg -l | grep -F 'flatpak')" ]
then
  echo "The 'flatpak' is already installed."
else
  echo "The 'flatpak' package is not installed. Do you want to install it?"
  read ANSWER
  if [ "$ANSWER" = 'y' ]
  then
    echo 'Proceeding with installation.'
    sudo apt install -y flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  fi
fi


declare -a FLATPAK_PKGS=(
  com.brave.Browser
  com.spotify.Client
)


for PKG in ${FLATPAK_PKGS[@]}
do
  if [ -n "$(flatpak list | grep -E "\<${PKG}")" ]
  then
    echo "Found: $PKG"
  else
    echo "Flatpak package ${PKG} not found. Would you like to install it? (y/N)"
    read ANSWER
    if [ "$ANSWER" = 'y' ]
    then
      echo 'Proceeding with package installation.'
      sudo flatpak install $PKG
      echo 'Done.'
    fi
  fi
done


exit 0
