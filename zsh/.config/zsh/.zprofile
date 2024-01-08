if [ "$(uname -s)" = 'Linux' ]
then
  keychain --nogui id_ed25519_bitbucket id_ed25519_github
  [ -z "${HOSTNAME}" ] && HOSTNAME=`uname -n`
  [ -f ${HOME}/.keychain/${HOSTNAME}-sh ] && . ${HOME}/.keychain/${HOSTNAME}-sh
  [ -f ${HOME}/.keychain/${HOSTNAME}-sh-gpg ] && . ${HOME}/.keychain/${HOSTNAME}-sh-gpg
elif [ "$(uname -s)" = 'Darwin' ]
then
  ssh-add --apple-load-keychain ~/.ssh/id_rsa_github
fi
