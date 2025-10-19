function pouptmux() {
  width=${2:-80%}
  height=${2:-80%}
  if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ]; then
    tmux detach-cnnlient
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
  '  --jq '.data.user.pullRequests.nodes[].repository.owner.login' | sort | uniq -c | sort -r
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
  items=("default" "nvim-dot" 'xlboy_nvim')
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
