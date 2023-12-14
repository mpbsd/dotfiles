# configuring $PATH
source "${HOME}/.config/zsh/rc/path.zsh"

# command completion
source "${HOME}/.config/zsh/rc/completion.zsh"

# key bindings
source "${HOME}/.config/zsh/rc/key_bindings.zsh"

# history search
source "${HOME}/.config/zsh/rc/history.zsh"

# vi mode
source "${HOME}/.config/zsh/rc/vimode.zsh"

# keychain
if [ "$(uname -s)" = 'Linux' ]
then
  source "${HOME}/.config/zsh/rc/keychain.zsh"
fi

# sourcery
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

# Custom functions that use FZF
source "${HOME}/.config/zsh/rc/globals.zsh"

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# prompt
# source "${HOME}/.config/zsh/rc/prompt.zsh"
eval "$(starship init zsh)"
