if [ "$(uname -s)" = 'Linux' ]
then
  keychain --nogui id_ed25519_bitbucket id_ed25519_github id_ed25519_vultr
  [ -z "${HOSTNAME}" ] && HOSTNAME=`uname -n`
  [ -f ${HOME}/.keychain/${HOSTNAME}-sh ] && . ${HOME}/.keychain/${HOSTNAME}-sh
  [ -f ${HOME}/.keychain/${HOSTNAME}-sh-gpg ] && . ${HOME}/.keychain/${HOSTNAME}-sh-gpg
fi
