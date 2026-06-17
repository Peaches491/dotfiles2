#!/bin/sh

function git_dump_all_versions() {
  if [ "$#" -ne 1 ] || [ "$1" == "help" ]
  then
    echo "dump all git versions of a file to separate files"
    echo 
    echo "usage: $0 FILENAME";
    echo 
    echo "e.g."
    echo 
    echo "$ $0 path/to/somefile.txt"
    echo 
    echo "path/to/somefile.txt.1.0dea419"
    echo "path/to/somefile.txt.1.0dea419.logmsg"
    echo "path/to/somefile.txt.2.cdea8s9"
    echo "path/to/somefile.txt.2.cdea8s9.logmsg"
    echo "path/to/somefile.txt.3.fdsf2d"
    echo "path/to/somefile.txt.3.fdsf2d.logmsg"
    echo "..."
    exit 1
  fi

  index=1
  for commit in $(git log --pretty=format:%h "$1")
  do
    padindex=$(printf %03d "$index")
    out="$1.$padindex.$commit"
    log="$out.logmsg"
    echo "saving version $index to file $out for commit $commit"
    echo "*******************************************************" > "$log"
    git log -1 --pretty=format:"%s%nAuthored by %an at %ai%n%n%b%n" "$commit" >> "$log"
    echo "*******************************************************" >> "$log"
    git show "$commit:./$1" > "$out"
    let index++
  done
}

function list_worktrees() {
  local tmpfile
  tmpfile=$(mktemp)

  # Gather worktree info
  git worktree list --porcelain | awk '
    /^worktree / {_path=$2}
    /^HEAD / {_head=$2; print _path "|" _head}
  ' | while IFS='|' read -r _path _head; do
    commit_date=$(git -C "$_path" show -s --format='%ci' "$_head")
    echo "$_path|$_head|$commit_date" >> "$tmpfile"
  done

  # Output header
  printf "%-40s %-12s %-25s\n" "Path" "Commit" "Date"
  printf "%-40s %-12s %-25s\n" "----" "------" "----"

  # Sort and print
  {
    echo -e "Path\tCommit\tDate"
    sort -t$'|' -k3 "$tmpfile"
  } | column -t -s $'|'

  rm "$tmpfile"
}

function git_dir_view() {
  files="$(git ls-tree --name-only HEAD -- $GIT_PREFIX)"

  lines=""
  while IFS= read -r f; do
      str="$(git log -1 --pretty=tformat:"%C(green)%cr%Creset  %x09  %C(cyan)%h%Creset  %s  %C(yellow)(%cn)%Creset" $f)"
      printf -v str "%s  --  %s\n" "$f" "$str"
      lines+="$(echo "$str" | sed 's#[\t ]\{2,\}#\t#g')"
      lines+=$'\n'
  done < <(printf '%s' "$files")

  echo "$lines" | column -ts $'\t'
}

