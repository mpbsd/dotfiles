# PATH
source "${HOME}/.config/zsh/rc/path.zsh"

# completion
source "${HOME}/.config/zsh/rc/completion.zsh"

# history
source "${HOME}/.config/zsh/rc/history.zsh"

# prompt
source "${HOME}/.config/zsh/rc/prompt.zsh"
# eval "$(starship init zsh)"

# vi mode
source "${HOME}/.config/zsh/rc/vimode.zsh"

# key bindings
source "${HOME}/.config/zsh/rc/mappings.zsh"

# keychain
source "${HOME}/.config/zsh/rc/keychain.zsh"

# syntax-highlighting and autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=#073642,fg=#eee8e5'
source '/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source '/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

# FZF
source '/usr/share/doc/fzf/examples/completion.zsh'
source '/usr/share/doc/fzf/examples/key-bindings.zsh'

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# bindings
source "${HOME}/.config/zsh/rc/bindings.zsh"
