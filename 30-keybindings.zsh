# ---- 移动（明确区分 Ctrl 和 Alt 的职责）----
# Ctrl: 字符级移动
bindkey '^h' backward-char
bindkey '^l' forward-char
bindkey '^j' down-line-or-history
bindkey '^k' up-line-or-history

# Alt: 单词级移动
bindkey '\eh' backward-word
bindkey '\el' forward-word
bindkey '\ej' down-line-or-history
bindkey '\ek' up-line-or-history

# ---- 行首/行尾 ----
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '\e[h' beginning-of-line
bindkey '\e[f' end-of-line

# ---- Undo ----
bindkey '\eu' undo
bindkey '\e[5;5u' undo          # Ghostty CSI u 模式下的 Ctrl+/

# ---- 快捷命令 ----
bindkey -s '\ee' 'nvim\n'
bindkey -s '\eo' 'cd ..\n'
bindkey -s '\e;' 'll\n'

# ---- 删除单词 ----
bindkey '\e^h' backward-kill-word
bindkey '\e^?' backward-kill-word

# ---- Alt+Arrow 移动 ----
bindkey '\e[1;3d' backward-word
bindkey '\e[1;3c' forward-word
bindkey '\e[1;3a' beginning-of-line
bindkey '\e[1;3b' end-of-line

# ---- Tmux 兼容 ----
if [[ -n "$TMUX" ]]; then
  bindkey -s '\e[1~' '\eOH'
  bindkey -s '\e[4~' '\eOF'
  export TERM=screen-256color
fi
