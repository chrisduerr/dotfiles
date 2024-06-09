#!/bin/sh

# Exit on error
set -e

# Key Bindings
catacomb msg bind-key --on-press '*' XF86PowerOff bash -c \
    "sleep 0 0 0 0 0 0 0 0.5 && \
        if [ \"\$(catacomb msg dpms)\" == \"on\" ]; then \
            (tremor 100 0 1; tzompantli) \
        fi"
catacomb msg bind-key '*' XF86PowerOff bash -c \
    "if pkill -xf -9 \"sleep 0 0 0 0 0 0 0 0.5\"; then \
        if [ \"\$(catacomb msg dpms)\" == \"on\" ]; then \
            catacomb msg dpms off; \
        else \
            catacomb msg dpms on; \
        fi \
    fi"
catacomb msg bind-key '*' EnableVirtualKeyboard \
    busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true
catacomb msg bind-key '*' AutoVirtualKeyboard \
    busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b false

# Gesture key bindings
catacomb msg bind-gesture-key 'Alacritty' tr mr --mods ctrl,shift v

# Per-application scale overrides
catacomb msg scale --app-id firefox 1.5
catacomb msg scale --app-id anki 1.25

# Spawn background apps
swaybg -i ~/pictures/wallpapers/skeleton.jpg --mode center &
squeekboard &
epitaph &

# Automatic dpms/suspend
swayidle -w \
    timeout 180 'catacomb msg dpms off' \
        resume 'catacomb msg dpms on' \
    timeout 210 'systemctl suspend' \
        after-resume 'catacomb msg dpms on' &

# Don't reboot on power button press
systemd-inhibit --what handle-power-key sleep infinity &

# Wait for completion
wait
