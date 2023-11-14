#!/bin/bash


ADDRESS='https://github.com/ryanoasis/nerd-fonts/releases/download'
VERSION='v3.0.2'

FONTDIR="${HOME}/.local/share/fonts"
TMPDIR="${HOME}/downloads"


# {{{
declare -a FONTSLIST=(
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


for FONTNAME in "${FONTSLIST[@]}"
do
  if [ ! -d "${FONTDIR}/${FONTNAME}" ]
  then
    mkdir -p ${FONTDIR}/${FONTNAME}
    wget "${ADDRESS}/${VERSION}/${FONTNAME}.tar.xz" -O ${TMPDIR}/${FONTNAME}.tar.xz
    tar -xvf ${TMPDIR}/${FONTNAME}.tar.xz -C ${FONTDIR}/${FONTNAME}
    rm -rf ${TMPDIR}/${FONTNAME}.tar.xz
  fi
done


# {{{
declare -a TXT_FILES=(
  Apache License.txt
  Bitstream Vera License.txt
  COPYING-LICENSE
  LICENCE-FAQ.txt
  LICENCE.txt
  LICENSE
  LICENSE.TXT
  LICENSE.md
  LICENSE.txt
  LICENSE_OFL.txt
  Licence.txt
  OFL.txt
  README.md
  SIL Open Font License.txt
  Vic Fieger License.txt
  license.txt
  readme.md
)
# }}}


for FILE in "${TXT_FILES[@]}"
do
  find $FONTDIR -type f -name $FILE -delete
done


exit 0
