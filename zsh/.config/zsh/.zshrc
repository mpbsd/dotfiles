# configuring $PATH
source "${HOME}/.config/zsh/rc/path.zsh"

# command completion
source "${HOME}/.config/zsh/rc/completion.zsh"

# key bindings
source "${HOME}/.config/zsh/rc/mappings.zsh"

# history search
source "${HOME}/.config/zsh/rc/history.zsh"

# vi mode
source "${HOME}/.config/zsh/rc/vimode.zsh"

# keychain
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

# syntax-highlighting and autosuggestions
if [ "$(uname -s)" = 'Linux' ]
then
  source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [ "$(uname -s)" = 'Darwin' ]
then
  source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# FZF
if [ "$(uname -s)" = 'Linux' ]
then
  source "/usr/share/doc/fzf/examples/completion.zsh"
  source "/usr/share/doc/fzf/examples/key-bindings.zsh"
elif [ "$(uname -s)" = 'Darwin' ]
then
  source "/usr/local/opt/fzf/shell/completion.zsh"
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# prompt
eval "$(starship init zsh)"
