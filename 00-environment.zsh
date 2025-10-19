# Core environment configuration
VISUAL=nvim
export VISUAL EDITOR=nvim
export EDITOR

# FZF configuration
export FZF_DEFAULT_OPTS='--bind ctrl-e:down,ctrl-u:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore-dir=node_modules -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX_HEIGHT='80%'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

export LSCOLORS=exfxcxdxbxexexxxxxxxxx
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US

# Load local bash/zsh compatible settings
_INIT_SH_NOFUN=1

# Highlight settings for less/man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# PATH and toolchain setup
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:~/go/bin:~/.local/bin:$HOME/Library/Python/3.11/bin:$PATH
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

export N_PREFIX="$HOME/.n"
export N_PRESERVE_NPM=1
export PATH=$N_PREFIX/bin:$PATH

# export GOPROXY=https://goproxy.io,direct
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export STARSHIP_LOG=error
export COREPACK_ENABLE_STRICT=0
export PATH=/Users/innei/.meteor:$PATH

# Rust toolchain
export PATH=$HOME/.cargo/bin:$PATH
source_env_overrides
