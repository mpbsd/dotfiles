keychain --nogui id_ed25519_bitbucket id_rsa_github id_rsa_gitlab id_rsa_obsdams
[ -z "${HOSTNAME}" ] && HOSTNAME=`uname -n`
[ -f ${HOME}/.keychain/${HOSTNAME}-sh ] && . ${HOME}/.keychain/${HOSTNAME}-sh
[ -f ${HOME}/.keychain/${HOSTNAME}-sh-gpg ] && . ${HOME}/.keychain/${HOSTNAME}-sh-gpg
