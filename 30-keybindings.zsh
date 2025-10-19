# Custom keybindings
bindkey -s '\ee' 'nvim\n'

bindkey '\eh' backward-char
bindkey '\el' forward-char
bindkey '\ej' down-line-or-history
bindkey '\ek' up-line-or-history

bindkey '^h' backward-char
bindkey '^l' forward-char
bindkey '^j' down-line-or-history
bindkey '^k' up-line-or-history

bindkey '\eu' undo

bindkey '\eH' backward-word
bindkey '\eL' forward-word
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

bindkey -s '\eo' 'cd ..\n'
bindkey -s '\e;' 'll\n'

bindkey '\e[1;3D' backward-word
bindkey '\e[1;3C' forward-word
bindkey '\e[1;3A' beginning-of-line
bindkey '\e[1;3B' end-of-line

if [[ -n "$TMUX" ]]; then
  bindkey -s '\e[1~' '\eOH'
  bindkey -s '\e[4~' '\eOF'
  export TERM=screen-256color
fi

bindkey -s ^a "nvims\n"

builtin bindkey "^A" beginning-of-line
builtin bindkey "^E" end-of-line
builtin bindkey "^[^H" backward-kill-word
builtin bindkey "^[^?" backward-kill-word
