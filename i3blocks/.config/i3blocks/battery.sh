#!/bin/bash

STATUS=$(acpi -b)

PERCENTAGE=$(echo "$STATUS" | grep -Eo "[0-9]+%")
CHARGING=$(echo "$STATUS" | grep -o "Charging")

if [ "$CHARGING" = "" ]
then

  FULL=$(echo "$STATUS" | grep -o "Full")

  if [ "$FULL" = "Full" ]
  then
    echo "B: 100%"
  else
    REMAINING=$(echo "$STATUS" | grep -Eo "[0-9]+:[0-9]+")
    echo "B: $PERCENTAGE ($REMAINING)"
  fi
  
else
  echo "<span color='#6A9955'>B: $PERCENTAGE</span>"
fi
