#!/usr/bin/env bash
set -euo pipefail

# ===============================
# Everforest Wallpaper Recolor
# ===============================
# Usage:
#   ./everforest-recolor.sh input.jpg
#   ./everforest-recolor.sh *.png
#
# Output:
#   input-everforest.jpg
# ===============================

for img in "$@"; do
  name="${img%.*}"
  ext="${img##*.}"

  magick "$img" \
    -auto-level \
    -modulate 96,82,96 \
    -gamma 0.96 \
    -brightness-contrast 2x4 \
    \
    \( +clone -fill "#a7c080" -colorize 6% \) -composite \
    \( +clone -fill "#dbbc7f" -colorize 4% \) -composite \
    \
    -colorspace HSL \
    -channel G -evaluate multiply 1.05 \
    -channel B -evaluate multiply 0.93 \
    -colorspace sRGB \
    \
    "${name}-everforest.${ext}"

  echo "✔ Generated ${name}-everforest.${ext}"
done
