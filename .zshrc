# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/theodor/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf) source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=white
ZSH_HIGHLIGHT_STYLES[arg0]=fg=white
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

KEYTIMEOUT=1

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

#ctf-alias
alias stego-docker="$HOME/dotfiles/scripts/stego-docker.sh"
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

#fix - remove the % sign
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

# exports
export EDITOR=nvim
export PASSWORD_STORE_DIR="/home/theodor/prog/webkom/password-store"
export BSPWM_DIR="/home/theodor/.config/bspwm"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

