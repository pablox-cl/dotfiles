# $ZDOTDIR/.zshrc

# zplug
export ZPLUG_LOADFILE=$ZDOTDIR/zplug.zsh
source ~/.zplug/init.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# exports
export NVM_DIR=~/.nvm

path=(
   ~/.local/bin
   ~/.rbenv/bin
   $path
)

function if_file_exists_run_it {
    [ -f "$1" ] && source "$1"
    }

#source $ZDOTDIR/bindings.zsh
#source $ZDOTDIR/aliases.zsh
#source $ZDOTDIR/git.zsh

HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=500000
SAVEHIST=$HISTSIZE

# Bindings & Options
bindkey '^[[Z' reverse-menu-complete       # Shift-Tab
bindkey -M viins '^?' backward-delete-char # Backspace

# setopt inc_append_history
setopt vi

# Completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# inits
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

if_file_exists_run_it "$NVM_DIR/nvm.sh"
if_file_exists_run_it  "~/.fzf.zsh"

if ! zplug check; then
    zplug install
fi
zplug load
