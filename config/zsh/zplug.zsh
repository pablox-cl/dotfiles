zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'modules/editor', from:prezto
zplug "$ZDOTDIR", from:local, use:"*.zsh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
