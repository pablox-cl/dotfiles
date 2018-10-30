# because I'm (too) lazy

# Use hub (http://hub.github.com/) if available
if (( $+commands[hub] )); then
  alias git=hub
else
  compdef g=git
fi

# No arguments: `git status`
# With arguments: acts like `git`
function _g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    # git status
    git status --short --ignore-submodules=dirty
  fi
}

# @url https://superuser.com/questions/1280348/zsh-autocompletion-breaks-when-i-add-a-wrapper-to-a-command
alias g=_g
compdef _g=git

# Some aliases
alias gia="git add --verbose" # maybe it should be done within git?

# Allows commit message without typing quotes (can't have quotes in the commit msg though).
# https://github.com/r00k/dotfiles/blob/master/zsh/functions#L44
function gc {
  git commit -m "$*"
}

# Don't try to glob with zsh so git can do the right stuff
# alias git='noglob git'

