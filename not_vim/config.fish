if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias tt="tig --date-order --all"
alias vim=nvim
alias gfa=" git fetch --all"

function fzf_git_recent_branch -d "Efficient fish keybinding for fzf with git branch"
  eval "git branch --sort=-authordate | fzf --query (commandline)" | read -l select

  if not test -z $select
    eval "git checkout (builtin string trim --left --chars='* ' $select)"
  end

  commandline -f repaint
end

bind \cg 'fzf_git_recent_branch'

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

export PATH=/Users/ivanho/Library/Python/3.8/bin:"$PATH"


# Created by `pipx` on 2023-07-07 08:30:21
set PATH $PATH /Users/ivanho/.local/bin
