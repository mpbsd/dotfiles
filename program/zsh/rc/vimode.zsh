bindkey -v
export KEYTIMEOUT=1

# add vi text-objects
#  parenthesis
#  square brackets
#  curly braces
#  angles
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed

for km in viopp visual
do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}
  do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}
  do
    bindkey -M $km $c select-bracketed
  done
done

# emulate vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# increment a number (like Vim8)
autoload -Uz incarg
zle -N incarg
bindkey -M vicmd '^a' incarg

# edit current command line with vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

# set the cursor based on vi (insert|normal) modes
function zle-keymap-select () {
  case "$KEYMAP" in
    vicmd)
      echo -ne '\e[5 q'
      ;;
    viins|main)
      echo -ne '\e[1 q'
      ;;
  esac
}

function zle-line-init() {
  zle -K viins
}

zle -N zle-keymap-select
zle -N zle-line-init
