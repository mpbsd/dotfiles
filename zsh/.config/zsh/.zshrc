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
parse_git_dirty() {
  git_status="$(git status 2>/dev/null)"
  [[ "$git_status" =~ "Changes to be committed:" ]] && echo -n "%F{green}·%f"
  [[ "$git_status" =~ "Changes not staged for commit:" ]] && echo -n "%F{yellow}·%f"
  [[ "$git_status" =~ "Untracked files:" ]] && echo -n "%F{red}·%f"
}
autoload -Uz promptinit; promptinit
setopt prompt_subst
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats ' (%F{254}%b%F{245})'
prompt_mytheme_setup() {
  NEWLINE=$'\n'
  PS1="%n@%m %~ ${vcs_info_msg_0_} $(parse_git_dirty) ${NEWLINE}> "
}

prompt_themes+=( mytheme )

prompt mytheme
# eval "$(starship init zsh)"
