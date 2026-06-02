#!/bin/bash
while true; do
    WEATHER=$(wttrbar --location Ankara --lang tr --custom-indicator "{ICON}{temp_C}°C" 2>/dev/null | jq -r '.text' 2>/dev/null || echo "?°C")
    echo "$WEATHER   $(date +'%d %B %Y  %H:%M')"
    sleep 60
done
