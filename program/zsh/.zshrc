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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=#073642,fg=#EEE8E5'
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'

# FZF
source '/usr/share/fzf/completion.zsh'
source '/usr/share/fzf/key-bindings.zsh'

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# bindings
source "${HOME}/.config/zsh/rc/bindings.zsh"
