bindkey '^N' up-line-or-beginning-search                    # [Ctrl-N]
bindkey '^T' down-line-or-beginning-search                  # [Ctrl-T]

bindkey "^S" forward-word                                   # [Ctrl-Right]
bindkey "^H" backward-word                                  # [Ctrl-Left]

bindkey "${terminfo[kdch1]}" delete-char                    # [Del]
