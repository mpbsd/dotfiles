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
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# FZF
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# starship prompt
eval "$(starship init zsh)"
