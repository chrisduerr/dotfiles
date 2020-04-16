# Set a color, if it already exists add a separator
colored() {
    local text="$1"
    local fg="$2"
    local bg="$3"

    # Create full ANSII format with color reset
    echo "%{\e[38;5;${fg};48;5;${bg}m%}$1%{\e[0m%}"
}

# Current directory structure
current_path() {
    # Actually one less
    local max_dir_len=15
    local max_dirs=3

    # Get current path
    local pwd=$(pwd)
    local output_path=""
    if [[ "$(pwd)" == "/home/$USER"* ]]; then
        local pwd=$(echo $pwd | sed 's/^\/home\/'$USER'//')
        local output_path="~"
    fi

    # Convert path to an array
    local array=("${(ps:/:)pwd}")

    # Shorten each element in the list
    local short_array=()
    for elem in "${array[@]}"; do
        local short_elem=$(echo $elem | head -c $max_dir_len | sed 's/./…/'$max_dir_len)
        short_array+=("$short_elem")
    done

    # Take only the last $max_dirs elements
    if [[ "$((${#short_array[@]} - 1))" -gt "$max_dirs" ]]; then
        local offset=$((${#short_array[@]} - $max_dirs))
        local short_array=("${short_array[@]:$offset:$max_dirs}")
        output_path+="/…/"
    fi

    # Reconstruct the path from the shortened list
    function join_by { local IFS="$1"; shift; echo "$*"; }
    local joined_array=$(join_by "/" "${short_array[@]}")
    local output_path="$output_path$joined_array"

    echo $(colored " $output_path " 7 8)
}

# Current version control status
vcs() {
    # Exit if not in git dir
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        return
    fi

    # Set branch name
    local branch=$(git symbolic-ref --short HEAD 2> /dev/null)

    # Check if there is new stuff to commit
    if [[ -n $(git rev-list "$branch"@{upstream}..HEAD 2> /dev/null) ]]; then
        local push=" ↑"
    fi

    # Get color based on directory status
    if [[ -n $(git status --porcelain) ]]; then
        echo $(colored " $branch$push " 0 9)
    else
        echo $(colored " $branch$push " 0 10)
    fi
}

# Current user
current_user() {
    # Set background based on vi mode
    if [[ "$KEYMAP" == "vicmd" ]]; then
        local bg=1
    else
        local bg=9
    fi

    if [[ "$USER" == "root" ]]; then
        echo $(colored ' R! ' 0 $bg)
    else
        echo $(colored ' UL ' 0 $bg)
    fi
}

function precmd {
    PS1="$(current_user)$(current_path)$(vcs) "
}

function zle-line-init zle-keymap-select {
    precmd
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
