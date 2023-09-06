change_directory() {
  DEST="$(find ~ -type d | fzf)"
  [[ -n "${DEST}" ]] && cd "${DEST}"
}

change_file() {
  find ~ -type f | fzf | xargs -ro vim
}
