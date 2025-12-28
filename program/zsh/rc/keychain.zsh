keychain --absolute --dir "${XDG_RUNTIME_DIR}/keychain" --quiet --nogui obsd pass home ghub cros
[ -z "${HOSTNAME}" ] && HOSTNAME=`uname -n`
[ -f "${XDG_RUNTIME_DIR}/.keychain/${HOSTNAME}-sh" ] && . "${XDG_RUNTIME_DIR}/.keychain/${HOSTNAME}-sh"
[ -f "${XDG_RUNTIME_DIR}/.keychain/${HOSTNAME}-sh-gpg" ] && . "${XDG_RUNTIME_DIR}/.keychain/${HOSTNAME}-sh-gpg"
