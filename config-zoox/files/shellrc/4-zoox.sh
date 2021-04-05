export WORKTREE_WORKTREE_ROOT=~/driving
export WORKTREE_PRIMARY_PROJECT=root
export WORKTREE_BRANCH_NAME_PREFIX=user/chris/
#export WORKTREE_BRANCH_NAME_SUFFIX=""
#export WORKTREE_BASE_BRANCH=master
#export WORKTREE_REMOTE=origin
WORKTREE_ENVIRONMENT_ENTRYPOINT=
WORKTREE_ENVIRONMENT_ENTRYPOINT+='builtin cd "$project_directory"'
WORKTREE_ENVIRONMENT_ENTRYPOINT+=' && tmux has-session -t "$project_name" 2>/dev/null'
WORKTREE_ENVIRONMENT_ENTRYPOINT+=' && tmux attach -t "$project_name"'
WORKTREE_ENVIRONMENT_ENTRYPOINT+=' || tmux new -s "$project_name"'
export WORKTREE_ENVIRONMENT_ENTRYPOINT

export VLR_ROOT="$HOME"
source "$(worktree_active_project_worktree)/scripts/shell/zooxrc.sh"

alias aws-mfa='oathtool --totp --base32 -w 1 "`cat ~/.aws/oathtool-mfa`"'
alias vault-auth='VAULT_ADDR=https://vault.zooxlabs.com:8200 vault login -method=ldap username=chris'

export dz=develop/zrn
export rz=release/zrn
export dc=develop/carta
export rc=release/carta

export odz=origin/develop/zrn
export orz=origin/release/zrn
export odc=origin/develop/carta
export orc=origin/release/carta

export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/dev-aws:$HOME/.kube/prod1"
export EDITOR=vim
