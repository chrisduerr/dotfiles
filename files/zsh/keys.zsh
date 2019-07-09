# Vi Mode
export KEYTIMEOUT=1
bindkey -v

# Fish autosuggestions
bindkey '^K' up-line-or-beginning-search
bindkey '^J' down-line-or-beginning-search

# Delet key
bindkey "${terminfo[kdch1]}" delete-char
