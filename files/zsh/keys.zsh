# DEL key
bindkey "${terminfo[kdch1]}" delete-char

# Fish autosuggestions
bindkey '^N' up-line-or-beginning-search
bindkey '^P' down-line-or-beginning-search

# Vi Mode
export KEYTIMEOUT=1
bindkey -v

# Fix backspace after leaving vi mode
bindkey '^?' backward-delete-char

# Fix delete last word after leaving vi mode
fix() {
	CURSOR=0
	zle .vi-insert
	CURSOR=$1
}
vi-insert() { fix $CURSOR }
vi-add-next() { fix $(($CURSOR + 1)) }
vi-add-eol() { fix $#BUFFER }
zle -N vi-insert
zle -N vi-add-next
zle -N vi-add-eol

# Allow replacing inside of parenthesis/quotes
autoload -U select-quoted select-bracketed surround
zle -N select-quoted
zle -N select-bracketed
zle -N delete-surround surround
zle -N change-surround surround

for m in visual viopp; do
	for c in {a,i}{\',\",\`}; do
		bindkey -M $m $c select-quoted
	done
	for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
		bindkey -M $m $c select-bracketed
	done
done

bindkey -a cs change-surround
bindkey -a ds delete-surround
