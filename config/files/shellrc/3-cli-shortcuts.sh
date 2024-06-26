function l() {
  ls --classify --color=always --escape --human-readable "$@"
}

function ll() {
  l -l "$@"
}

function la() {
  l -l --all "$@"
}

function catr() {
  find "$@" -type f | xargs --no-run-if-empty cat
}

function ifind() {
  find . -iname "$@"
}

function wfind() {
  find . -wholename "*$@"
}

function gg() {
  rg --hidden --no-heading --smart-case --glob '!.git/*' --glob '!*/.git/*' "$@"
}

function uriencode() {
  jq --raw-input --raw-output --slurp '@uri'
}

function k() {
  kubectl "$@"
}

function e() {
  "$EDITOR" "$@"
}

function eo() {
  e -o "$@"
}

function eO() {
  e -O "$@"
}

function ep() {
  e -p "$@"
}

function cl() {
  clear
}
