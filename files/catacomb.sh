#!/bin/sh

# Exit on error
set -e

# Key Bindings
catacomb msg bind-key '*' XF86PowerOff tzompantli

# Per-application scale overrides
catacomb msg scale --app-id firefox 1.5

# Spawn Shit
swaybg -i ~/pictures/wallpapers/skeleton.jpg --mode center &
squeekboard &
epitaph &

# Wait for completion
wait
