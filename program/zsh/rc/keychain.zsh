<<<<<<< HEAD
keychain --quiet --nogui obsd pass home ghub cros
=======
keychain --quiet --nogui obsd pass ghub cros
>>>>>>> 8be2cea (rename ssh keys)
[ -z "${HOSTNAME}" ] && HOSTNAME=`uname -n`
[ -f ${HOME}/.keychain/${HOSTNAME}-sh ] && . ${HOME}/.keychain/${HOSTNAME}-sh
[ -f ${HOME}/.keychain/${HOSTNAME}-sh-gpg ] && . ${HOME}/.keychain/${HOSTNAME}-sh-gpg
