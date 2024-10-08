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
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# FZF
source "/usr/share/doc/fzf/examples/completion.zsh"
source "/usr/share/doc/fzf/examples/key-bindings.zsh"

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# zsh prompt

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "(%b) %m%u%c"
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='${PWD/#$HOME/~} ${vcs_info_msg_0_}
> '
