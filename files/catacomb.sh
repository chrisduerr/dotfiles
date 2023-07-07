#!/bin/sh

# Exit on error
set -e

# Key Bindings
catacomb msg bind-key '*' XF86PowerOff tzompantli

# Spawn Shit
swaybg -i ~/pictures/wallpapers/skeleton.jpg --mode center &
squeekboard &
epitaph &

# Wait for completion
wait
