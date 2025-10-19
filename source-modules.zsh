# Helper to conditionally source configuration fragments
source_if_exist() {
  local candidate="$1"

  if [ -z "$candidate" ]; then
    return 1
  fi

  if [ -s "$candidate" ] || [ -f "$candidate" ]; then
    # shellcheck disable=SC1090
    source "$candidate"
  fi
}

# Additional environment overrides that should run early
source_env_overrides() {
  source_if_exist "$HOME/.cargo/env"
}

# Plugin-related customisations that must happen before `antigen apply`
source_antigen_overrides() {
  source_if_exist "$HOME/.local/etc/config.zsh"
  source_if_exist "$HOME/.local/etc/local.zsh"
  source_if_exist "$HOME/.zshrc.local"
  source_if_exist "$HOME/.config/zsh/zshrc"
  source_if_exist "/usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh"
}

# Miscellaneous add-ons that hook into interactive tooling
source_shell_addons() {
  source_if_exist "$HOME/.fzf.zsh"
  # tabtab source for packages; uninstall by removing this line
  source_if_exist "$HOME/.config/tabtab/zsh/__tabtab.zsh"
  source_if_exist "$HOME/.bun/_bun"
  source_if_exist "$HOME/.zshrc_local"
}
