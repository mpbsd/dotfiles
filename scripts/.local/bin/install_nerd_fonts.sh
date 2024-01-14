#!/usr/bin/env bash

ADDRESS='https://github.com/ryanoasis/nerd-fonts/releases/download'
VERSION='v3.1.1'

FNTDIR="${HOME}/.local/share/fonts"
TMPDIR="${HOME}/downloads/nerdfonts"

SYSTEM="$(uname -s)"

[[ -d "${FNTDIR}" ]] || mkdir -p "${FNTDIR}"
[[ -d "${TMPDIR}" ]] || mkdir -p "${TMPDIR}"

# FONTLIST {{{
declare -a FONTSLIST=(
  0xProto
  3270
  Agave
  AnonymousPro
  Arimo
  AurulentSansMono
  BigBlueTerminal
  BitstreamVeraSansMono
  CascadiaCode
  CascadiaMono
  CodeNewRoman
  ComicShannsMono
  CommitMono
  Cousine
  D2Coding
  DaddyTimeMono
  DejaVuSansMono
  DroidSansMono
  EnvyCodeR
  FantasqueSansMono
  FiraCode
  FiraMono
  GeistMono
  Go-Mono
  Gohu
  Hack
  Hasklig
  HeavyData
  Hermit
  iA-Writer
  IBMPlexMono
  Inconsolata
  InconsolataGo
  InconsolataLGC
  IntelOneMono
  Iosevka
  IosevkaTerm
  IosevkaTermSlab
  JetBrainsMono
  Lekton
  LiberationMono
  Lilex
  MartianMono
  Meslo
  Monaspace
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
  Ubuntu
  UbuntuMono
  VictorMono
)
# }}}

for FONTNAME in "${FONTSLIST[@]}"
do
  if [ ! -d "${FNTDIR}/${FONTNAME}" ]
  then
    mkdir -p "${FNTDIR}/${FONTNAME}"
    PKGONLINE="${ADDRESS}/${VERSION}/${FONTNAME}.tar.xz"
    PKGONDISK="${TMPDIR}/${FONTNAME}.tar.xz"
    wget "${PKGONLINE}" -O "${PKGONDISK}"
    if [ "${SYSTEM}" = 'Linux' ]
    then
      tar -xvf "${PKGONDISK}" -C "${FNTDIR}/${FONTNAME}"
    elif [ "${SYSTEM}" = 'OpenBSD' ]
    then
      xzcat "${PKGONDISK}" | tar xvf - -C "${FNTDIR}/${FONTNAME}"
    fi
    rm -rf "${PKGONDISK}"
  fi
done

# TXT_FILES {{{
declare -a TXT_FILES=(
  'Apache License.txt'
  'Bitstream Vera License.txt'
  'COPYING-LICENSE'
  'LICENCE-FAQ.txt'
  'LICENCE.md'
  'LICENCE.txt'
  'LICENSE'
  'LICENSE.TXT'
  'LICENSE.md'
  'LICENSE.txt'
  'LICENSE_OFL.txt'
  'Licence.txt'
  'OFL.txt'
  'README.md'
  'SIL Open Font License.txt'
  'Vic Fieger License.txt'
  'license.txt'
)
# }}}

for FILE in "${TXT_FILES[@]}"
do
  find "${FNTDIR}" -type f -name "${FILE}" -delete
done

fc-cache -fv

[[ -d "${TMPDIR}" ]] && rm -rf "${TMPDIR}"

exit 0
