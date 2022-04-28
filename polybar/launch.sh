#!/bin/bash
(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  tray_output=eDP1
  main_output=eDP1

  for m in $outputs; do
    if [[ $m == "HDMI1" ]]; then
        tray_output=$m
        main_output=$m
    fi
  done

  for m in $outputs; do
    export MONITOR=$m
    # export TRAY_POSITION=none
    # if [[ $m == $tray_output ]]; then
    #   TRAY_POSITION=right
    # fi

    if [[ $m == $main_output ]]; then
      polybar --reload mainbar </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
      disown
    else
      polybar --reload sidebar </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
      disown
    fi
  done
) 200>/var/tmp/polybar-launch.lock