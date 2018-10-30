#
# Executes commands at login pre-zshrc, only if it's a login shell.
# Examples:
#   * tty
#   * ssh
#

EDITOR='nvim'
VISUAL='nvim'
PAGER='less'

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
LESS='-F -g -i -M -R -S -w -X -z-4'

export EDITOR VISUAL PAGER LESS

