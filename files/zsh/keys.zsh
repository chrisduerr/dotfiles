# Vi Mode
export KEYTIMEOUT=1
bindkey -v

# Fix backspace after leaving vi mode
bindkey '^?' backward-delete-char

# Fix delete last word after leaving vi mode
bindkey '^w' backward-kill-word

# Fish autosuggestions
bindkey '^N' up-line-or-beginning-search
bindkey '^P' down-line-or-beginning-search

# DEL key
bindkey "${terminfo[kdch1]}" delete-char
