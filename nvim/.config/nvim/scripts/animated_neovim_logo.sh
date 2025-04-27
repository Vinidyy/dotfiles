#!/bin/bash

# Logo lines
logo_lines=(
"    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
"    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
"    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
"    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
"    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
"    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
)

# Available colors for animation (ANSI color codes)
colors=(31 32 33 34 35 36 91 92 93 94 95 96)

# Animation settings
frame_rate_ms=30  # Frame rate in milliseconds (approx. 33 FPS)
color_change_interval=10  # Change color every 10 frames
current_frame=0
sparkle_interval=2  # Sparkles will appear every 2 frames

# Get terminal dimensions
term_width=$(tput cols)
term_height=$(tput lines)

# Calculate the center position
center_x=$((term_width / 2 - 30))  # Adjust 30 to fit logo width
center_y=$((term_height / 2 - 3))  # Adjust 3 to fit logo height

# Function to add random sparkles
add_sparkles() {
  local line="$1"
  sparkle_line=""
  
  # Add sparkles every 2 frames
  if (( current_frame % sparkle_interval == 0 )); then
    for ((i=0; i<${#line}; i++)); do
      char="${line:i:1}"
      # Only replace spaces with sparkles
      if [[ "$char" == " " && $((RANDOM % 20)) -eq 0 ]]; then
        rand=$((RANDOM % 3))  # Three possible sparkle types
        if [[ $rand -eq 0 ]]; then
          sparkle_line+="."
        elif [[ $rand -eq 1 ]]; then
          sparkle_line+="+"
        else
          sparkle_line+="o"
        fi
      else
        sparkle_line+="$char"
      fi
    done
  else
    sparkle_line="$line"
  fi
  
  echo "$sparkle_line"
}

# Function to draw the logo in place without clearing the screen each time
draw_logo() {
  local y_offset="$1"
  
  # Draw each line of the logo with appropriate colors
  for ((i=0; i<${#logo_lines[@]}; i++)); do
    # Move the cursor to the correct position
    tput cup $((y_offset + i)) $center_x
    # Update the line with color and sparkles
    sparkle_line=$(add_sparkles "${logo_lines[$i]}")
    echo -e "\e[${color}m$sparkle_line\e[0m"
  done
}

# Clear the terminal before starting
clear

# Main animation loop
while true; do
  # Change color every `color_change_interval` frames
  if (( current_frame % color_change_interval == 0 )); then
    color=${colors[$((RANDOM % ${#colors[@]}))]}  # Pick a random color from the array
  fi
  
  # Draw the logo with the updated color and sparkles
  draw_logo $center_y
  
  # Increment frame counter
  ((current_frame++))

  # Sleep to maintain the frame rate (in seconds)
  sleep 0.$((frame_rate_ms))

  # Exit after 30 seconds for demo purposes (remove this for continuous animation)
  if ((current_frame > 750)); then
    break
  fi
done

# Clear the terminal when exiting
clear
