#!/bin/bash

# Run Hyprpicker and copy the selected color to clipboard
color=$(hyprpicker -a)

# Check if a color was selected
if [[ -n "$color" ]]; then
  echo -n "$color" | wl-copy
  notify-send "Hyprpicker" "Color copied: $color" -i color-picker
else
  notify-send "Hyprpicker" "No color selected" -i error
fi
