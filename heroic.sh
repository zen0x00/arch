#!/usr/bin/env bash
set -euo pipefail

# Heroic passes the game executable as arguments
GAME_CMD=("$@")

# Environment variables
export MANGOHUD=1
export DXVK_HUD=0

# Optional: log launch
echo "Launching game: ${GAME_CMD[*]}" >> /tmp/heroic-launch.log

# Launch with extras
gamescope \
  -W 1920 -H 1080 \
  -r 300 \
  -f \
  -- mangohud gamemoderun "${GAME_CMD[@]}"
