export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/kuba/.oh-my-zsh"
export EDITOR="/opt/homebrew/bin/nvim"

# Golang
export GOPATH=$HOME/Workspace/golang # don't forget to change your path correctly!
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE="on"

# Rust
export PATH=$PATH:/Users/kuba/.cargo/bin


export SSH_AUTH_SOCK=/Users/kuba/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
# Ruby
#export RUBY_PATH=$HOME/.gem/ruby/3.0.0
#export PATH=$PATH:$RUBY_PATH/bin

# Kubectl krew
export PATH="${PATH}:${HOME}/.krew/bin"

plugins=(fzf git oc kubectl helm ansible gcloud terraform docker aws asdf doctl) 

source $ZSH/oh-my-zsh.sh

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# password decoder
alias bpass='python3 ~/Documents/get_password.py'
alias chat='python3 ~/Documents/chatGPT.py'
alias blog='python3 trimer.py'
alias vim='nvim'
# install exa, teamocil, awsp
alias ll='exa --icons --header --long'
alias lt='exa --icons --tree --level=2'

# AWS
alias ec="aws ec2 describe-instances --output yaml --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==\`Name\`].Value]' --no-cli-pager"
alias ssm="aws ssm start-session --target"
alias auth="ykman oath accounts code"

# LP lab
alias lab-exit="sudo sh -c 'cat /Users/kuba/Workspace/configs/resolv.conf.normal > /var/run/resolv.conf'"
alias lab-enter="sudo sh -c 'cat /Users/kuba/Workspace/configs/resolv.conf.lab > /var/run/resolv.conf'"
eval "$(starship init zsh)"


# docker
#alias dx="docker context use"
dx() {
    export DOCKER_CONTEXT=${1}
    export DOCKER_TLS_VERIFY="1"
    export DOCKER_CERT_PATH=/Users/Kuba/.docker/ampere
    export DOCKER_BUILDKIT="1" 
    export COMPOSE_DOCKER_CLI_BUILD="1"
    unset DOCKER_HOST
}
dxd() {
    export DOCKER_CONTEXT=desktop-linux
    export DOCKER_BUILDKIT="1" 
    export COMPOSE_DOCKER_CLI_BUILD="1"
    export DOCKER_HOST=unix:///Users/kuba/.docker/run/docker.sock
    unset DOCKER_CERT_PATH
    unset DOCKER_TLS_VERIFY
}

dxdo() {
    export DOCKER_CONTEXT=digital-ocean
    export DOCKER_BUILDKIT="1" 
    export COMPOSE_DOCKER_CLI_BUILD="1"
    unset DOCKER_CERT_PATH
    unset DOCKER_TLS_VERIFY
}

dcc() {
    docker context create ${1} --docker "host=tcp://${1}.aiolab.link:2376,ca=/Users/kuba/.docker/ampere/ca.pem,cert=/Users/kuba/.docker/ampere/cert.pem,key=/Users/kuba/.docker/ampere/key.pem"
}

dodcc() {
    docker context update digital-ocean --docker "host=ssh://kuba@$(tf output -raw public_ip):4444"
}

dossh() {
    P=$(pwd)
    cd ~/Workspace/DO
    IP=$(tf output -raw public_ip)
    cd $P
    ssh kuba@$IP -p 4444
}
alias di="docker images | docker-color-output"
alias dps="docker ps | docker-color-output"

#export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaadspecwedajoq62lwr4hwf47mou7aosv24hcq5bow45rpqxkmacra"
#export TF_VAR_fingerprint="f0:3a:e7:d6:c1:10:4f:da:84:ba:6c:36:02:cc:3e:92"
#export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaadfogwfmgjoi35onknsnu6u5zfp43gh657appkvbghhzyhfhh5oya"
#export TF_VAR_private_key_path="/Users/kuba/Workspace/OnSpecta/terraform-oci-ampere-tensorflow/key.pem"
#export TF_VAR_region="us-phoenix-1"

