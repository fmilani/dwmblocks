#!/bin/bash

# Get default input device name
SOURCE=$(pactl get-default-source)

# Check current mute state
MUTE_STATE=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')

# Toggle mute
if [ "$MUTE_STATE" = "yes" ]; then
  echo "🤐"
fi

