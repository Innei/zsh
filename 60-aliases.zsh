alias nvim-dot="NVIM_APPNAME=nvimdots nvim"

alias c='clear'
alias e='exit'
alias pip='pip3'
alias proxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias pc='proxychains4 zsh'
alias cdr='cd $(git rev-parse --show-toplevel)'

alias ga='git status'
alias gc='git clone'
alias gm='git commit -m'
alias gpo='git push -u origin $(git symbolic-ref --short HEAD)'
alias gp='git push'
alias gb='git branch'
alias gpl='git pull'
alias gf='git fetch --all --prune'
alias gs='git stash'
alias gr='git rebase'
alias gt='git log --graph --oneline --all'
alias gco='git checkout'
alias gignore='git update-index --assume-unchanged'
alias gnoignore='git update-index --no-assume-unchanged'
alias gclean='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias main='git checkout main || git checkout master'

alias g='lazygit'

# git commit
alias gm1='git commit -m "chore: update deps"'

alias t='tldr'
alias mkdir='mkdir -p'
alias mkidr='mkdir -p'

alias vf='nvim $(fzf)'
alias cdt='cd $(find * -type d | fzf)'
alias gct='git checkout $(git branch -r | fzf)'

alias cl='cloc . --exclude-dir=node_modules,.nuxt,.next,build,.vscode,dist,release,tmp --exclude-lang=JSON,SVG,XML'

# alias cl='tokei . -e node_modules -e .nuxt -e .next -e build -e .vscode -e dist -e release -e tmp'
alias r='joshuto'
alias q='exit'

alias ll='ls -l'
alias d='nr dev'

alias tnew='tmux new -s'
alias tkall='tmux kill-session -a'
alias ta='tmux attach-session'
alias yanr='yarn'

alias ss='lsof -Pn -i4 | grep LISTEN'

alias dns8='networksetup -setdnsservers Wi-Fi 8.8.8.8'
alias dns114='networksetup -setdnsservers Wi-Fi 114.114.114.114'
alias dnsali='networksetup -setdnsservers Wi-Fi 223.5.5.5'
alias dns='networksetup -setdnsservers Wi-Fi "Empty"'

alias netpw='networksetup -setmanual Wi-Fi 10.0.0.61 255.255.255.0 10.0.0.1 && networksetup -setdnsservers Wi-Fi 10.0.0.1'
alias netpass='networksetup -setmanual Wi-Fi 10.0.0.61 255.255.255.0 10.0.0.8 && networksetup -setdnsservers Wi-Fi 10.0.0.8'
alias netdp='networksetup -setdhcp Wi-Fi && networksetup -setdnsservers Wi-Fi "Empty"'
alias nettest='networksetup -setmanual Wi-Fi 10.0.0.61 255.255.255.0 10.0.0.11 && networksetup -setdnsservers Wi-Fi 10.0.0.11'

alias charge80='sudo bclm write 80'
alias charge60='sudo bclm write 60'
alias charge='sudo bclm write 100'

alias npm='pnpm'
alias npx='pnpx'
alias nn='\n'
alias n='pnpm'
alias nenv='export PATH="$PATH:./node_modules/.bin"'
alias clang++='clang++ --std=c++17'

alias nv=nvim

# alias gh cli
alias ghb='gh browse '
alias approve_and_merge_prs="for pr in \$( gh pr list | grep 'renovate' | cut -f1 -d '	'); do gh pr review --approve \$pr && gh pr merge \$pr --auto --squash; done"

alias md='frogmouth '
# alias jq='jless '

alias cc='claude --dangerously-skip-permissions'

# GitHub Copilot CLI (default: autopilot mode)
alias cop='copilot --mode autopilot'

# Ghostty: copy local terminfo to remote on ssh (avoids xterm-ghostty missing)
ssh() {
  if [[ "$TERM" == "xterm-ghostty" ]]; then
    infocmp -x 2>/dev/null | command ssh "$@" -- 'tic -x -' &>/dev/null
  fi
  command ssh "$@"
}
