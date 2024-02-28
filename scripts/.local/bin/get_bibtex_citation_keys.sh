#!/bin/bash


BIBFILE="${HOME}/.local/share/references/zotero.bib"


get_keys() {
  cat $BIBFILE | sed -n '/^@/p' | sed 's/\(^@[^{]\+{\|,$\)//g' | fzf
}


get_keys


exit 0
