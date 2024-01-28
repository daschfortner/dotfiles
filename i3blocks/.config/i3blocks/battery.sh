#!/bin/bash

# echo "B: "

STATUS=$(acpi -b)

PERCENTAGE=$(echo "$STATUS" | grep -Eo "[0-9]+%")
CHARGING=$(echo "$STATUS" | grep -o "Charging")

if [ "$CHARGING" = "" ]
then
  REMAINING=$(echo "$STATUS" | grep -Eo "[0-9]+:[0-9]+")
  echo "B: $PERCENTAGE ($REMAINING)"
else
  echo "<span color='#6A9955'>B: $PERCENTAGE</span>"
fi
