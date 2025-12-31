typeset -a KEYS=(
  obsd
  pass
  home
  ghub
  cros
)

keychain \
  --absolute \
  --dir "${XDG_RUNTIME_DIR}/keychain" \
  --nogui \
  --quiet \
  "${(z)KEYS}"
