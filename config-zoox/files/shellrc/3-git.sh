alias git=hub
export HUB_PROTOCOL=git
export GITHUB_HOST=git.zooxlabs.com
export GITHUB_TOKEN="$(cat ~/.github-token)"
export GITHUB_USER=chris
export GITHUB_REPOSITORY=zooxco/driving

function g() {
  git "$@"
}

export m=master
export om=origin/master
