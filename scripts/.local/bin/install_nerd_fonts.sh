#!/bin/bash


ADDRESS='https://github.com/ryanoasis/nerd-fonts/releases/download'
VERSION='v3.0.2'
PKGDEST="${HOME}/.local/share/fonts"


# FONTS {{{
declare -a FONTS=(
  3270
  Agave
  AnonymousPro
  Arimo
  AurulentSansMono
  BigBlueTerminal
  BitstreamVeraSansMono
  CascadiaCode
  CodeNewRoman
  ComicShannsMono
  Cousine
  DaddyTimeMono
  DejaVuSansMono
  DroidSansMono
  FantasqueSansMono
  FiraCode
  FiraMono
  Gohu
  Go-Mono
  Hack
  Hasklig
  HeavyData
  Hermit
  iA-Writer
  IBMPlexMono
  InconsolataGo
  InconsolataLGC
  Inconsolata
  IosevkaTerm
  Iosevka
  JetBrainsMono
  Lekton
  LiberationMono
  Lilex
  Meslo
  Monofur
  Monoid
  Mononoki
  MPlus
  NerdFontsSymbolsOnly
  Noto
  OpenDyslexic
  Overpass
  ProFont
  ProggyClean
  RobotoMono
  ShareTechMono
  SourceCodePro
  SpaceMono
  Terminus
  Tinos
  UbuntuMono
  Ubuntu
  VictorMono
)
# }}}


for FONT in ${FONTS[@]}
do
  if [ ! -d "${PKGDEST}/${FONT}" ]
  then
    mkdir -p ${PKGDEST}/${FONT}
    cd ${PKGDEST}/${FONT}
    wget "${ADDRESS}/${VERSION}/${FONT}.tar.xz"
    tar -xvf ${FONT}.tar.xz
    find ${PKGDEST}/${FONT} -type f -name 'LICENSE' | xargs rm -rf
    find ${PKGDEST}/${FONT} -type f -name "*.txt"   | xargs rm -rf
    find ${PKGDEST}/${FONT} -type f -name "*.md"    | xargs rm -rf
    rm -rf ${FONT}.tar.xz
  fi
done


exit 0
