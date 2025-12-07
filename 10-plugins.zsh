# Zinit: https://github.com/zdharma-continuum/zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "${ZINIT_HOME%/*}" 2>/dev/null
  if command -v git >/dev/null 2>&1; then
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" >/dev/null 2>&1
  else
    echo "zinit: git is required to install zinit automatically." >&2
  fi
fi

if [ -f "$ZINIT_HOME/zinit.zsh" ]; then
  source "$ZINIT_HOME/zinit.zsh"
else
  echo "zinit: missing $ZINIT_HOME/zinit.zsh, please install zinit manually." >&2
fi

# oh-my-zsh core (lazy loaded through zinit)
OMZ_ROOT="${ZSH:-$HOME/.oh-my-zsh}"
if [ ! -d "$OMZ_ROOT" ]; then
  if command -v git >/dev/null 2>&1; then
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$OMZ_ROOT" >/dev/null 2>&1
  else
    echo "oh-my-zsh: git is required to install oh-my-zsh automatically." >&2
  fi
fi

export ZSH="$OMZ_ROOT"
ZSH_THEME="${ZSH_THEME:-}"

typeset -a plugins
source_if_exist "$HOME/.config/zsh/ohmyzsh-plugins.zsh"
if ((${#plugins[@]} == 0)); then
  plugins=(git fzf 1password brew npm ssh vscode)
fi

# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

if typeset -f zinit >/dev/null 2>&1; then
  if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  
    zinit snippet "$ZSH/oh-my-zsh.sh"
  else
    source_plugin_overrides
  fi

  # Core plugins

  zinit light zsh-users/zsh-completions
  # zle -N menu-search
  # zle -N recent-paths
  # zinit ice depth=1 wait'1' lucid
  # zinit light marlonrichert/zsh-autocomplete

  zinit light zsh-users/zsh-autosuggestions

  zinit light zdharma-continuum/fast-syntax-highlighting

  zinit ice depth=1 wait'1' lucid
  zinit light zsh-users/zsh-history-substring-search

  zinit ice depth=1 wait'1' lucid
  # MichaelAquilina/zsh-you-should-use
  zinit light MichaelAquilina/zsh-you-should-use
else
  [ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"
  source_plugin_overrides
fi
