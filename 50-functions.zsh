function pouptmux() {
  width=${2:-80%}
  height=${2:-80%}
  if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ]; then
    tmux detach-client
  else
    tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t popup || tmux new -s popup"
  fi
}

# Get the owner of the repository to which you contributed (Pull Requests)
ghpall() {
  gh api graphql --paginate -f query='
    query($endCursor: String) {
      user(login: "Innei") {
        pullRequests(first: 100, after: $endCursor, states: MERGED) {
          nodes { repository { owner { login } } }
          pageInfo {
            hasNextPage
            endCursor
          }
        }
      }
    }
  ' --jq '.data.user.pullRequests.nodes[].repository.owner.login' | sort | uniq -c | sort -r
  # Merge all dependency PRs
  gh search prs --owner Innei author:app/renovate --json "url" --jq ".[].url" | xargs -I {} gh pr merge {} --squash --auto
}

ghdep() {
  gh search prs --owner innei is:open author:app/renovate archived:false --json url --jq ".[].url" | gxargs -I URL bash -c 'echo "Approving & merging: URL" && gh pr review --approve URL && gh pr merge --squash --auto URL'
}

ghfl() {
  gh api /user --jq '"🎉 @" + .login + " has " + (.followers|tostring) + " followers!"'
}

function nvims() {
  items=("default" "vscode-nvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config >" --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

kitty-reload() {
  kill -SIGUSR1 $(pidof kitty)
}

function cdroot() {
  cd "$(identify-monorepo-root)"
}

# ----- Spaceship custom sections -----
# system_icons: show system icon similar to starship custom.system_icons
spaceship_system_icons() {
  local icon
  case "$(uname -s)" in
  Darwin) icon="" ;;
  Linux) icon="" ;;
  *) icon="" ;;
  esac
  [[ -z "$icon" ]] && return
  spaceship::section \
    "$SPACESHIP_SYSTEM_ICONS_COLOR" \
    "$SPACESHIP_SYSTEM_ICONS_PREFIX" \
    "$icon" \
    "$SPACESHIP_SYSTEM_ICONS_SUFFIX"
}

# giturl: display remote provider icon
spaceship_giturl() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  local remote symbol
  remote=$(command git ls-remote --get-url 2>/dev/null) || return
  case "$remote" in
  *github*) symbol=" " ;;
  *gitlab*) symbol=" " ;;
  *bitbucket*) symbol=" " ;;
  *git*) symbol=" " ;;
  *) symbol=" " ;;
  esac
  spaceship::section \
    "$SPACESHIP_GITURL_COLOR" \
    "$SPACESHIP_GITURL_PREFIX" \
    "$symbol" \
    "$SPACESHIP_GITURL_SUFFIX"
}

# lastcommit: show last commit short hash and subject
spaceship_lastcommit() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  local out
  out=$(git show -s --format=' %h "%s"' 2>/dev/null) || return
  [[ -z "$out" ]] && return
  spaceship::section \
    "$SPACESHIP_LASTCOMMIT_COLOR" \
    "$SPACESHIP_LASTCOMMIT_PREFIX" \
    "$out" \
    "$SPACESHIP_LASTCOMMIT_SUFFIX"
}

# git_email: show configured git user.email
spaceship_git_email() {
  command git rev-parse --git-dir &>/dev/null || return
  local email
  email=$(git config user.email 2>/dev/null) || return
  [[ -z "$email" ]] && return
  spaceship::section \
    "$SPACESHIP_GIT_EMAIL_COLOR" \
    "$SPACESHIP_GIT_EMAIL_PREFIX" \
    "$email" \
    "$SPACESHIP_GIT_EMAIL_SUFFIX"
}
