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
source "${HOME}/.config/zsh/rc/keychain.zsh"

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
source "${HOME}/.local/share/npm/lib/node_modules/spaceship-prompt/spaceship.zsh"
