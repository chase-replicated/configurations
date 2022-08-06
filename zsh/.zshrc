autoload -Uz compinit
compinit
eval "$(starship init zsh)"
export GOPATH=$HOME/go
export PATH="${PATH}:${HOME}/.krew/bin:${GOPATH}/bin:/usr/local/go/bin"
export GO111MODULE=auto
export KUBECONFIG=$HOME/.kube/contexts/kubeconfig
export GOROOT=/usr/local/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

kctx () {
  kubectl ctx -c | cut -d '-' -f 5
}

k () {
  AWS_PROFILE=$(kctx) kubectl $@
}

watchk () {
  AWS_PROFILE=$(kctx) watch kubectl $@
}

kaws () {
  AWS_PROFILE=$(kctx) aws $@
}

tf () {
  AWS_PROFILE=$(kctx) terraform $@
}

k1s () {
  AWS_PROFILE=$(kctx) k9s --context $(kubectl ctx -c) --readonly
}


source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl completion zsh)
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

complete -F __start_kubectl k
