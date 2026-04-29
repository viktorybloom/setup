# --- oh-my-zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

# --- env ---
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

export DEV_ENV="$HOME/dev"
export GOPATH="$HOME/.local/go"
export DENO_INSTALL="$HOME/.deno"
export N_PREFIX="$HOME/.local/n"

# --- fzf ---
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# --- path ---
add_path_front() {
    [[ -d "$1" && ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

add_path_front "$HOME/.local/bin"
add_path_front "$HOME/.local/scripts"
add_path_front "$HOME/.local/apps"
add_path_front "$HOME/.local/go/bin"
add_path_front "/usr/local/go/bin"

# --- aliases ---
alias vim='nvim'
alias tmux='tmux -2'
alias ll='ls -alF --color=auto'
alias l='ls -A --color=auto'
alias grep='grep --color=auto'

# --- functions ---
catr() {
    tail -n "+$1" "$3" | head -n "$(($2 - $1 + 1))"
}

cat1Line() {
    tr -d "\n" < "$1"
}


