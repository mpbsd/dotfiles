keychain --quiet --nogui bitbucket github home vultr rpios
[ -z "${HOSTNAME}" ] && HOSTNAME=`uname -n`
[ -f ${HOME}/.keychain/${HOSTNAME}-sh ] && . ${HOME}/.keychain/${HOSTNAME}-sh
[ -f ${HOME}/.keychain/${HOSTNAME}-sh-gpg ] && . ${HOME}/.keychain/${HOSTNAME}-sh-gpg
