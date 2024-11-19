#!/bin/sh

run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

run "sleep 2"
run "systemctl --user restart picom.service"
run "blueman-applet"
run "nm-applet"
run "xrandr --output DisplayPort-3 --mode 1920x1080 --rate 120 --primary --right-of DisplayPort-5"
run "xrandr --output DisplayPort-5 --mode 1920x1080 --rate 120"
# run "emacs --daemon"
# run "$HOME/.config/polybar/launch.sh"
# run "xscreensaver -no-splash"
