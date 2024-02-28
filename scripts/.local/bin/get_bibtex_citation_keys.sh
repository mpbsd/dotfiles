#!/bin/bash


BIBFILE="${HOME}/.local/share/references/zotero.bib"


get_keys() {
  KEY="$(sed -n '/^@/p' "$BIBFILE" | sed 's/\(^@[^{]\+{\|,$\)//g' | fzf)"
  echo "$KEY"
}


get_keys


exit 0
