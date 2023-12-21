#!/bin/sh

# Exit on error
set -e

# Key Bindings
catacomb msg bind-key '*' XF86PowerOff tzompantli

# Gesture key bindings
catacomb msg bind-gesture-key 'Alacritty' tr mr --mods ctrl,shift v

# Per-application scale overrides
catacomb msg scale --app-id firefox 1.5
catacomb msg scale --app-id anki 1.25

# Spawn Shit
swaybg -i ~/pictures/wallpapers/skeleton.jpg --mode center &
squeekboard &
epitaph &

# Wait for completion
wait
