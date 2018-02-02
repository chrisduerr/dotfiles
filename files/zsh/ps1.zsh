# Reset the terminal color
col_reset() {
    echo "%{\033[0m%}"
}

# Set a color, if it already exists add a separator
set_color() {
    local fg="$1"
    local bg="$2"

    # CTERM -> ANSII FG
    local fg=$(($fg + 30))
    if [[ "$fg" -gt 37 ]]; then
        local fg=$(($fg + 52))
    fi

    # CTERM -> ANSII BG
    local bg=$(($bg + 40))
    if [[ "$bg" -gt 47 ]]; then
        local bg=$(($bg + 52))
    fi

    # Create full ANSII format
    local col="%{\033[0;${fg};${bg}m%}"

    # Check if there needs to be a separator
    if [[ "$bg" == "$CURRENT_BG" ]]; then
        local col="$col|"
    fi

    CURRENT_COL="$col"
    CURRENT_BG="$bg"
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

    set_color 7 8
    CURRENT_PATH="$(echo $CURRENT_COL $output_path $(col_reset))"
}

# Current version control status
vcs() {
    # Exit if not in git dir
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        return
    fi

    # Set branch name
    local branch=$(git symbolic-ref --short HEAD 2> /dev/null)

    # Get color based on directory status
    if [[ -n $(git status --porcelain) ]]; then
        set_color 0 9 # Changed -> Red
    else
        set_color 0 10 # Unchanged -> Green
    fi

    # Check if there is new stuff to commit
    if [[ -n $(git rev-list "$branch"@{upstream}..HEAD 2> /dev/null) ]]; then
        local push=" ↑"
    fi

    VCS="$(echo $CURRENT_COL $branch$push $(col_reset))"
}

# Current user
current_user() {
    set_color 0 9
    if [[ "$USER" == "root" ]]; then
        CURRENT_USER="$(echo $CURRENT_COL R! $(col_reset))"
    else
        CURRENT_USER="$(echo $CURRENT_COL UL $(col_reset))"
    fi
}

function precmd {
    # Export variables
    current_user
    current_path
    vcs

    PS1="$CURRENT_USER$CURRENT_PATH$VCS "

    # Unset all variables
    unset CURRENT_USER
    unset CURRENT_PATH
    unset VCS
    unset CURRENT_COL
    unset CURRENT_BG
}
