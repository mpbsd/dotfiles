#!/usr/bin/bash


if [ -n "$(dpkg -l | grep -F 'flatpak')" ]
then
  echo "The 'flatpak' package is already installed."
else
  echo "The 'flatpak' package is not installed."
  echo 'Do you want to install it? (y/N)'
  read ANSWER
  if [ "$ANSWER" = 'y' ]
  then
    echo 'Proceeding with installation.'
    sudo apt install -y flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  fi
fi


declare -a FLATPAK=(
  com.brave.Browser
  org.zotero.Zotero
  com.spotify.Client
)


for PKG in ${FLATPAK[@]}
do
  if [ -n "$(flatpak list | grep -E "\<${PKG}\>")" ]
  then
    echo "Found: $PKG"
  else
    echo "Flatpak package ${PKG} not found."
    echo 'Would you like to install it? (y/N)'
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
