#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini

# Start Polybar on each connected monitor
i=0
monitors=$(xrandr --listmonitors | awk 'NR > 1 {print $4}')
for m in $monitors; do
  echo $m
  export MONITOR=$m
  polybar --config="$HOME/.config/polybar/config.ini" example$i &
  ((i++))
done

echo "Polybar launched..."
