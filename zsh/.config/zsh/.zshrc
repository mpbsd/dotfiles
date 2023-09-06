# configuring $PATH
source ${HOME}/.config/zsh/rc/path.zsh

# command completion
source ${HOME}/.config/zsh/rc/completion.zsh

# key bindings
source ${HOME}/.config/zsh/rc/key_bindings.zsh

# history search
source ${HOME}/.config/zsh/rc/history.zsh

# vi mode
source ${HOME}/.config/zsh/rc/vimode.zsh

# keychain
source ${HOME}/.config/zsh/rc/keychain.zsh

# sourcery
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# Custom functions that use FZF
source ${HOME}/.config/zsh/rc/globals.zsh

# aliases
source "${HOME}/.config/zsh/zsh_aliases"

# prompt
source ${HOME}/.config/zsh/rc/git.zsh
source ${HOME}/.config/zsh/rc/prompt.zsh
