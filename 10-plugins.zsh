# Antigen: https://github.com/zsh-users/antigen
ANTIGEN="$HOME/.local/bin/antigen.zsh"

# Install antigen.zsh if not exist
if [ ! -f "$ANTIGEN" ]; then
  [ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local" 2>/dev/null
  [ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin" 2>/dev/null
  [ ! -f "$HOME/.z" ] && touch "$HOME/.z"
  URL="https://cdn.jsdelivr.net/gh/zsh-users/antigen@master/bin/antigen.zsh"
  TMPFILE="/tmp/antigen.zsh"
  if [ -x "$(which curl)" ]; then
    curl -L "$URL" -o "$TMPFILE"
  elif [ -x "$(which wget)" ]; then
    wget "$URL" -O "$TMPFILE"
  else
    echo "ERROR: please install curl or wget before installation !!"
    exit
  fi
  if [ ! $? -eq 0 ]; then
    echo ""
    echo "ERROR: downloading antigen.zsh ($URL) failed !!"
    exit
  fi
  echo "move $TMPFILE to $ANTIGEN"
  mv "$TMPFILE" "$ANTIGEN"
fi

# Initialize antigen and plugins
source "$ANTIGEN"

antigen use oh-my-zsh

# antigen bundle colorize
# antigen bundle rupa/z z.sh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle willghatch/zsh-cdr
# antigen theme robbyrussell

# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

source_antigen_overrides
