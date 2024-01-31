#!/bin/bash

CONNECTION_STATUS=$(nmcli -f state -t general)

if [ "$CONNECTION_STATUS" = "connected" ]; then
  ACTIVE_CONNECTION=$(nmcli -f name -t connection show --active | head -n 1)

  echo "<span color='#6A9955'>N: $ACTIVE_CONNECTION</span>"
else
  echo "<span color='#f44747'>N: disconnected</span>"
fi

