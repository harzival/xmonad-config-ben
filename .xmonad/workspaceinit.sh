=#!/bin/bash
xsetroot -solid "#002b36"
trayer --widthtype pixel --width 100 --heighttype pixel --height 34 --align right --edge top --tint 0x002b36 --alpha 0 --transparent true &
/home/harzival/scripts/pia.sh &
nm-applet &
pnmixer &

exec vivaldi &
exec thunderbird &
exec spotify &
