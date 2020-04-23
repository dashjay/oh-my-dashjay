# set for npm proxy
#npm config set registry https://registry.npm.taobao.org

# set for autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Path to your oh-my-zsh installation.

export ZSH="/Users/dashjay/.oh-my-zsh"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# all alias
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

alias ip="curl cip.cc"

# set for nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh"  ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# 换mac地址的
macup(){
   e=$(openssl rand -hex 6 | sed 's/../&:/g;s/:$//')
   sudo ifconfig en0 ether $e
   echo $e
}

# set for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# set for proxy
alias proxyup="export https_proxy=http://127.0.0.1:1087 http_proxy=http://127.0.0.1:1087 all_proxy=socks5://127.0.0.1:1086"
alias proxydown="unset https_proxy && unset http_proxy && unset all_proxy"

# set for go
export PATH=$PATH:$HOME/go/bin

ZSH_THEME="af-magic"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
