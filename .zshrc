# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi


####################
##### ENVSTUFF #####
####################

# Use vim for ssh instead of nvim
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH=$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH
export VISUAL="nvim"

# Set cd and ls folder colors
export LS_COLORS='ow=33:'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:*' menu yes select


######################
##### ALIASSTUFF #####
######################

alias sshul="ssh -p 6666 undeadleech@undeadleech.com"
alias leechnot="python2 ~/Scripts/leechnot.py"
alias sct='systemctl'
alias vim="nvim"


# POWERLINE
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
