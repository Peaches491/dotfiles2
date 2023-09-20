function tmux() {
  command tmux -2 "$@"
}

function tl() {
  tmux list-sessions
}

function tm() {
  local name
  name="$1"
  readonly name

  if [ -z "$name" ]; then
    tmux new
  elif tmux has-session -t "$name" 2>/dev/null; then
    tmux attach -t "$name"
  else
    tmux new -s "$name"
  fi
}

alias tml="tl"

function tma() {
  local target
  target="$1"
  readonly target

  if [ -n "$target" ]; then
    tmux attach -t "$target"
  else 
    echo "Target session not specified. Listing sessions:"
    tl
    return 1
  fi
}

function tmk() {
  local target
  target="$1"
  readonly target

  if [ -n "$target" ]; then
    tmux kill-session -t "$target"
  else 
    echo "Target session not specified. Listing sessions:"
    tl
    return 1
  fi
}

