#!/usr/bin/env zsh

# fpath=("$(workspace_data_dir)/completion" $fpath)

workspace() {
  eval $($(workspace_data_dir)/workspace.py "$@")
}

alias ws=workspace

reload_completion() {
  local f
  #f=(~/.zsh-completions/*(.))
  f=(/home/daniel/dotfiles/config/files/workspace/completion/_workspace)
  unfunction $f:t 2> /dev/null
  autoload -U $f:t
}

alias ws='workspace '
alias wscd='workspace cd'
alias wss='workspace source '
