# $ZDOTDIR/.zshrc

# zplug
export ZPLUG_LOADFILE=$ZDOTDIR/zplug.zsh
source ~/.zplug/init.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# exports
export NVM_DIR="$HOME/.nvm"

path=(
   ~/.local/bin
   ~/.rbenv/bin
   $path
)

#source $ZDOTDIR/bindings.zsh
#source $ZDOTDIR/aliases.zsh
#source $ZDOTDIR/git.zsh
source $NVM_DIR/nvm.sh

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

# rbenv init
eval "$(rbenv init -)"

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if ! zplug check; then
    zplug install
fi
zplug load
