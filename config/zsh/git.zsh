# Use hub (http://hub.github.com/) if available
if (( $+commands[hub] )); then
  alias g=git
  alias git=hub
  # compdef g=hub
  compdef hub=git
else
  compdef g=git
fi

# No arguments: `git status`
# With arguments: acts like `git`
unalias g
function g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    # git status
    git status --short --ignore-submodules=dirty
  fi
}

# Allows commit message without typing quotes (can't have quotes in the commit msg though).
# https://github.com/r00k/dotfiles/blob/master/zsh/functions#L44
#unalias gc
function gc {
  git commit -m "$*"
}

# Don't try to glob with zsh so git can do the right stuff
# alias git='noglob git'
