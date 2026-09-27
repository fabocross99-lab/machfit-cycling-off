#!/usr/bin/env bash
# Genera assets/footage.mp4 (vertical 1080x1920, rotación aplicada, keyframes densos
# para búsquedas rápidas) a partir del video original de WhatsApp.
set -euo pipefail
cd "$(dirname "$0")"
ffmpeg -y -v error -i assets/source/entreno-alex-mazon.mp4 \
  -vf "scale=1080:1920:flags=lanczos,unsharp=5:5:0.6:5:5:0.0,format=yuv420p" \
  -c:v libx264 -preset medium -crf 19 -g 15 -r 30 \
  -c:a aac -b:a 192k -ar 48000 -metadata:s:v rotate=0 \
  -movflags +faststart assets/footage.mp4
