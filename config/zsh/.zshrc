# $ZDOTDIR/.zshrc

# zplug
export ZPLUG_LOADFILE=$ZDOTDIR/zplug.zsh
source ~/.zplug/init.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# exports
export NVM_DIR=~/.nvm
export FZF_DEFAULT_COMMAND='
  ( git ls-tree -r --name-only HEAD ||
    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
    sed s/^..//
  ) 2>/dev/null
'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

path=(
   ~/.local/bin
   ~/.yarn/bin
   ~/.config/yarn/global/node_modules/.bin
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

# got to fix this, dunno why it's working so bad (is prezto/editor??)
# setopt vi
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt CASE_GLOB

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
