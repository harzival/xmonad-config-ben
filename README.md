# xmonad-config-ben
Configuration files used to achieve my xmonad based debian setup.
I have used Debian 9 Stretch (with xfce, mate or gnome) as my distro, this is recomended if you want this to work out of the box.
This is not a generic config, it is tailored to my needs. I may make a generic branch with more docs.
It is also worth noting that out of the box that I use a 4k setup, so everything is scaled for 4k screens,
if your on linux with a 4k setup, this is a joy. If you dont want to use 4k, get rid of the .Xresource file
and modify the xmobar and border widths acordingly; I will make a branch for this too shortly.

To install this, you need to copy everything here into your home directory, but before that run this apt command:
sudo apt install xmonad* gnome suckless-tools dmenu trayer

That stuff is essential, but there is other stuff needed unless you modify .xmonad/workspaceinit.sh.
By default (and for me) it starts trayer, pia.sh, nm-applet, pnmixer commands start the system tray with just volume, network info and vpn controls (private internet access).
After that, vivaldi, tunderbird and spotify are launched. These are sorted by xmonad into the workspace layout.

.xmonad/workspaceinit.hs 
```bash
#!/bin/bash
xsetroot -solid "#002b36"
trayer --widthtype pixel --width 100 --heighttype pixel --height 34 --align right --edge top --tint 0x002b36 --alpha 0 --transparent true &
~/scripts/pia.sh &
nm-applet &
pnmixer &

exec vivaldi &
exec thunderbird &
exec spotify &
```
