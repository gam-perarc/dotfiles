# Path to oh-my-zsh installation.
export ZSH="/home/gam/.oh-my-zsh"

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(git)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# set EDITOR
export EDITOR='nvim'

# bat theme
export BAT_THEME="Nord"

# aliases
alias vim="nvim"
alias cfg="GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME vim"
alias zshrc="cfg ~/.zshrc"
alias vimrc="cfg ~/.vimrc"
alias tmuxrc="cfg ~/.tmux.conf.local"
alias alacrittyrc="cfg ~/.alacritty.yml"
alias android="~/android-studio/bin/studio.sh"
alias config='/usr/bin/git --git-dir=/home/gam/.cfg/ --work-tree=/home/gam'

# load directory colors config
eval "$(dircolors ~/.dircolors)";

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag . --hidden --ignore="*node_modules/*" --ignore=".git/*" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gam/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gam/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gam/google-cloud-sdk/completion.zsh.inc'; fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Andoid SDK and emulator
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# add ${ZDOTDIR:-~}/.zsh_functions as fpath reference
fpath+=${ZDOTDIR:-~}/.zsh_functions
