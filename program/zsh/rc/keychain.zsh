typeset -a KEYS=(
  obsd
  pass
  home
  berg
  ghub
  cros
)

keychain \
  --absolute \
  --dir "${XDG_DATA_HOME}/keychain" \
  --nogui \
  --quiet \
  "${(z)KEYS}"
