#!/bin/bash
# Update cloudflare URLs in index.html
# 
# Usage:
#   1. Start services: bash start_all_services.sh
#   2. Start tunnels: bash start_cloudflare_tunnels.sh
#   3. Copy the public URLs from cloudflare terminals
#   4. Edit this script and paste the URLs below
#   5. Run: bash update_urls.sh

# ==============================================================
# EDIT THESE URLs - Copy from cloudflare tunnel terminals
# ==============================================================
F5TTS_URL="https://very-bacterial-dome-said.trycloudflare.com"
LIPSYNC_URL="https://preservation-brother-hip-crystal.trycloudflare.com"
WHISPER_URL="https://outline-series-poet-mathematical.trycloudflare.com"
# ==============================================================

# Backup index.html
cp index.html index.html.backup

# Update URLs in index.html using sed
sed -i "s|\"box1\": {[^}]*}|\"box1\": {\n                    \"name\": \"Voice clone AI\",\n                    \"url\": \"$F5TTS_URL\",\n                    \"image\": \"F5TTS.PNG\"\n                }|g" index.html

sed -i "s|\"box2\": {[^}]*}|\"box2\": {\n                    \"name\": \"Lip sync AI\",\n                    \"url\": \"$LIPSYNC_URL\",\n                    \"image\": \"LIPSYNC.PNG\"\n                }|g" index.html

sed -i "s|\"box3\": {[^}]*}|\"box3\": {\n                    \"name\": \"Voice to text AI\",\n                    \"url\": \"$WHISPER_URL\",\n                    \"image\": \"WHISPER.PNG\"\n                }|g" index.html

echo "✓ URLs updated in index.html"
echo ""
echo "Updated URLs:"
echo "  - F5-TTS Voice Clone: $F5TTS_URL"
echo "  - Lip-Sync: $LIPSYNC_URL"
echo "  - Whisper Transcribe: $WHISPER_URL"
echo ""
echo "Backup saved as: index.html.backup"
