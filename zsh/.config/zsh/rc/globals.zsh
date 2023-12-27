change_directory() {
  local dir
  dir="$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)" && cd "${dir}"
  # DEST="$(find ~ -type d | fzf)"
  # [[ -n "${DEST}" ]] && cd "${DEST}"
}

change_file() {
  find ~ -type f | fzf | xargs -ro vim
}
