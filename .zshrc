# Load modular Zsh configuration
ZSH_CONFIG_DIR="$HOME/.config/zsh"

if [ -d "$ZSH_CONFIG_DIR" ]; then
  SOURCE_HELPERS="$ZSH_CONFIG_DIR/source-modules.zsh"
  [ -r "$SOURCE_HELPERS" ] && source "$SOURCE_HELPERS"

  while IFS= read -r config_file; do
    [ -r "$config_file" ] && source "$config_file"
  done < <(find "$ZSH_CONFIG_DIR" -maxdepth 1 -type f -name '*.zsh' ! -name 'source-modules.zsh' -print | sort)
fi
