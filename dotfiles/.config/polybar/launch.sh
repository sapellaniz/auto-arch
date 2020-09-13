#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
 for m in $(polybar -m | cut -f 1 -d ":"); do                                    
     MONITOR=$m polybar --reload example &                                       
 done 
#polybar example &

echo "Polybar launched..."
