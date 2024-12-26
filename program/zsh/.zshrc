# PATH
source "${HOME}/.config/zsh/rc/path.zsh"

# completion
source "${HOME}/.config/zsh/rc/completion.zsh"

# history
source "${HOME}/.config/zsh/rc/history.zsh"

# prompt
source "${HOME}/.config/zsh/rc/prompt.zsh"

# vi mode
source "${HOME}/.config/zsh/rc/vimode.zsh"

# key bindings
source "${HOME}/.config/zsh/rc/mappings.zsh"

# keychain
source "${HOME}/.config/zsh/rc/keychain.zsh"

# syntax-highlighting and autosuggestions
# source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# syntax-highlighting and autosuggestions
if [ "$(uname -s)" = 'Linux' ]
then
  source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# FZF
# source "/usr/share/doc/fzf/examples/completion.zsh"
# source "/usr/share/doc/fzf/examples/key-bindings.zsh"
if [ "$(uname -s)" = 'Linux' ]
then
  source "/usr/share/doc/fzf/examples/completion.zsh"
  source "/usr/share/doc/fzf/examples/key-bindings.zsh"
else
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# a little bit of fun
if [ -x /usr/local/bin/fortune -a -x /usr/local/bin/cowsay ]
then
  fortune | cowsay -f tux | lolcat
fi
