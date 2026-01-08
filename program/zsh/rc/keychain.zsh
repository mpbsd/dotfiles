typeset -a KEYS=(
  obsd
  pass
  home
  ghub
  cros
)

keychain \
  --absolute \
  --dir "${XDG_CACHE_HOME}/keychain" \
  --nogui \
  --quiet \
  "${(z)KEYS}"
