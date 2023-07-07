#!/bin/bash

# Directory where all the Linux ISOs are stored.
torrent_dir="/mnt/zslow/torrents"

# Find all files in /mnt/share/torrents/ and /mnt/share/torrents/*/ that have no
# hardlinks and are at least 5MB in size.
unlinked=$(find "$torrent_dir" -maxdepth 2 -type f -links 1 -size +5M)

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

# Skip cleanup if there's nothing to cleanup.
if [[ "${#nukem[@]}" == 0 ]]; then
    echo -e "\e[32mNo unused torrents found\e[0m"
    exit 0
fi

# List all torrents which will be deleted.
echo -e "\e[31mTorrents to be deleted:\e[0m"
for nuke in "${nukem[@]}"; do
    shortened=${nuke#"${torrent_dir}/"}
    if [[ -d "$nuke" ]]; then
        echo -e "  \e[34m$shortened\e[0m"
    else
        echo -e "  \e[32m$shortened\e[0m"
    fi
done

# Prompt for confirmation.
printf "\n\e[31mDelete all unused torrents? [y/N] \e[0m"
read -n 1 -r
echo

# Nukeit.
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for nuke in "${nukem[@]}"; do
        sudo rm -rf "$nuke"
    done
fi

# Bye. :)
echo -e "\e[32mSuccessfully deleted all unused torrents.\e[0m"
