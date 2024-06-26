# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf) source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=white
ZSH_HIGHLIGHT_STYLES[arg0]=fg=white
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

KEYTIMEOUT=1
# edgeDB
fpath+=~/.zfunc
# aliases
alias vim="nvim"
alias ll="exa --long"
alias tmux="tmux -u" # color-fix in termite
alias lego-builds="~/dotfiles/scripts/tmux-lego.sh"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias prc="vim ~/.p10k.zsh"
alias vifm="vifmrun"
alias dotf="vifm ~/dotfiles"
alias prog="vifm ~/prog"
alias pyvenv="python -m venv venv && source venv/bin/activate"
alias ap="ansible-playbook"
alias av="ansible-vault"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gld="git log --oneline --graph --decorate"
alias code="vscodium"
alias t="todo.sh"
alias master="/home/theodor/Documents/notes/Research/Master/ttm4905-master-thesis"

#ctf-alias
alias stego-docker="$HOME/dotfiles/scripts/stego-docker.sh"
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

#fix - remove the % sign
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

typeset -g POWERLEVEL9K_NVM_SHOW_SYSTEM=false

# exports
export EDITOR=nvim
# export PASSWORD_STORE_DIR="/home/theodor/prog/webkom/password-store"
export PASSWORD_STORE_DIR="/home/theodor/.password-store"
export BSPWM_DIR="/home/theodor/.config/bspwm"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# android-dev stuff
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#export JAVA_HOME=/usr/lib/jvm/java-15-openjdk
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/
export PATH=$PATH:$JAVA_HOME
export ANDROID_STUDIO="$HOME/builds/android-studio"
export PATH=${PATH}:$ANDROID_STUDIO/bin
export PIPX_BIN_DIR="$HOME/.local/pipx-bin/"
export PYTHONPATH="/usr/lib"

# Created by `userpath` on 2021-02-14 23:16:00
export PATH="$PATH:/home/theodor/.local/pipx-bin"

# Created by `userpath` on 2021-02-14 23:16:01
export PATH="$PATH:/home/theodor/.local/bin"

export PATH="$PATH:/opt/riscv/bin"

export PATH="$PATH:/home/theodor/.local/node/bin"


# function pandoc {
#   echo pandoc $@
#   docker run --rm --volume "`pwd`:/data" pandoc-template --template eisvogel "$@"
# }

export PNPM_HOME="/home/theodor/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export ANSIBLE_NOCOWS=1

# go stuff
export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOPATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/theodor/builds/google-cloud-sdk/path.zsh.inc' ]; then . '/home/theodor/builds/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/theodor/builds/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/theodor/builds/google-cloud-sdk/completion.zsh.inc'; fi
source /usr/share/nvm/init-nvm.sh
