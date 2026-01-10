typeset -a KEYS=(
  obsd
  pass
  home
  ghub
  cros
)

keychain \
  --absolute \
  --dir "${XDG_DATA_HOME}/keychain" \
  --nogui \
  --quiet \
  "${(z)KEYS}"
