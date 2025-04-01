#!/bin/bash

# Directories where all the Linux ISOs are stored.
torrent_dirs=("/mnt/zslow/shows/torrents" "/mnt/zfast/movies/torrents")

for torrent_dir in ${torrent_dirs[*]}; do
    echo "Deleting torrents in ${torrent_dir}…"

    # Find all files in ${torrent_dir} and ${torrent_dir}/* that have no
    # hardlinks and are at least 5MB in size.
    unlinked=$(find "$torrent_dir" -maxdepth 2 -type f -links 1 -size +5M)

    # Skip directory if there are no files without hardlinks.
    if [ -z "${unlinked}" ]; then
        echo -e "\e[32mNo unused torrents found\e[0m"
        continue
    fi

    # Files and directories which should be removed.
    nukem=()

    # Iterate over removable files.
    while IFS= read -r file; do
        dir=$(dirname "$file")
        if [[ "$dir" == "$torrent_dir" ]]; then
            # Add file if torrent is not a directory with multiple files.
            nukem+=("$file")
        else
            # Check if directory was already added.
            is_duplicate=0
            for nuke in "${nukem[@]}"; do
                if [[ "$nuke" == "$dir" ]]; then
                    is_duplicate=1
                    break
                fi
            done

            # Skip checks for duplicate directories.
            if [[ $is_duplicate == 1 ]]; then
                continue
            fi

            # Only add directory if no other hardlinked files are in it.
            linked=$(find "$dir" -maxdepth 1 -type f -links +1 -size +5M)
            if [[ -z "$linked" ]]; then
                nukem+=("$dir")
            fi
        fi
    done <<< "$unlinked"

    # Allow refinement of the torrent list.
    while true; do
        # Stop once the list is empty.
        if [[ ${#nukem[@]} == 0 ]]; then
            echo -e "\e[32mNo unused torrents found\e[0m\n"
            continue 2
        fi

        # List all torrents which will be deleted.
        echo -e "\e[31mTorrents to be deleted:\e[0m"
        for ((i=0; i < ${#nukem[@]}; i++)); do
            nuke=${nukem[i]}
            shortened=${nuke#"${torrent_dir}/"}
            if [[ -d "$nuke" ]]; then
                echo -e "  [$i] \e[34m$shortened\e[0m"
            else
                echo -e "  [$i] \e[32m$shortened\e[0m"
            fi
        done

        # Prompt for user choice.
        printf "\n\e[31mEnter number of torrent to exclude, or 'y' to confirm all: \e[0m"
        read -r

        if [[ $REPLY =~ ^[Yy]$ ]]; then
            break
        elif [[ $REPLY =~ ^[0-9]+$ && -n "${nukem[REPLY]}" ]]; then
            shortened=${nukem[REPLY]#"${torrent_dir}/"}
            echo -e "\e[32mIgnoring torrent \"$shortened\"\n"

            # Create a new array without the excluded element.
            new_nukem=()
            for ((i=0; i < ${#nukem[@]}; i++)); do
                if [[ $i != $REPLY ]]; then
                    new_nukem+=("${nukem[i]}")
                fi
            done
            nukem=("${new_nukem[@]}")
        else
            echo -e "\e[31mInvalid input: \e[0m$REPLY\n"
        fi
    done

    # Nukeit.
    for nuke in "${nukem[@]}"; do
        sudo rm -rf "$nuke"
    done
    echo -e "\e[32mSuccessfully deleted ${#nukem[@]} unused torrents\e[0m\n"
done
