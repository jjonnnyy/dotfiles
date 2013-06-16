# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git pacman compleat)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
autoload -U compinit
compinit

export EDITOR="vim"
alias mount-server="mount /media/server"
alias mount-usb="sudo mount -o uid=1000"
alias mount-uni="sshfs je809@shell2.doc.ic.ac.uk: /media/uni"
alias yup="yaourt -Syua"
alias df="df -h"
alias du="du -h"
alias rsync="rsync -h"
alias ls="ls --color=auto -h"
alias setbg="feh --bg-fill ~/.bgimg"
alias connectmouse="sudo hidd --search"

function find-grep-i {
    find . -name $1 -exec grep -iHn $2 {} \;
}

function find-grep {
    find . -name $1 -exec grep -Hn $2 {} \;
}

function gitignore {
    echo $1 >> .gitignore
}
