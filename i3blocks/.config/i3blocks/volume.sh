#!/bin/bash

PACTL_OUTPUT=$(pactl --format json list sinks)
VOLUME=$(echo "$PACTL_OUTPUT" | jq 'first(.[].volume[] | .value_percent)')

echo "V: $(echo "$VOLUME" | tr -d '"')"
