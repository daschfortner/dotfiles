#!/bin/bash

PACTL_OUTPUT=$(pactl --format json list sinks)

if [ "$(echo "$PACTL_OUTPUT" | jq '.[].mute')" = "true" ]
then
  echo "V: muted"
else
  VOLUME=$(echo "$PACTL_OUTPUT" | jq 'first(.[].volume[] | .value_percent)')

  echo "V: $(echo "$VOLUME" | tr -d '"')"
fi

