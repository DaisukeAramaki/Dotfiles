#!/bin/sh

#Enable uim at startup
#export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
#export GTK_IM_MODULE=uim
#export XMODIFIERS="@im=uim"
#export LANG=ja_JP.UTF-8 LANGUAGE=ja_JP.UTF-8 LC_MESSAGES=ja_JP.UTF-8

#Enable Japanese uim module
#uim-xim --engine=anthy &

#Set Wallpaper
#feh --bg-fill ~/Pics/tc.png &
#feh --bg-tile ~/GNUstep/Library/AfterStep/non-configurable/0_background &
feh --bg-fill ~/Pics/neutrino3.jpg &

#URxvt daemon
urxvtd -q -o -f

#Set Keyboard Layout
setxkbmap de &

#Removing the ugly x cursor
xsetroot -cursor_name left_ptr

#FontPath - Not needed here (NVIDIA Blob!)
#xset fp+ /usr/local/lib/X11/fonts/terminus/
#xset fp+ /usr/local/lib/X11/fonts/MonteCarlo-PCF/
#xset fp+ /usr/local/lib/X11/fonts/Proggy/
#xset fp+ /usr/local/lib/X11/fonts/Opti/
#xset fp+ /usr/local/lib/X11/fonts/vc/
#xset fp+ /usr/local/lib/X11/fonts/runt/
#xset fp+ /usr/local/lib/X11/fonts/jmk/
#xset fp+ /usr/local/share/texmf-dist/fonts/
#xset fp+ /usr/local/share/ghostscript/fonts/
#xset fp+ /usr/local/lib/X11/fonts/boxxy/
#xset fp+ /home/shiva/.fonts/
#xset fp rehash

#numlockx &
#exec mpd &
#exec conky &

#WindowManagers/Environments
#exec fvwm2

# dwm
#while true
#do
#   xsetroot -name "`date`"
#   sleep 1
#done &
#exec dwm

#exec cwm

#exec hackedbox

#sleep 5 && bbpager &

#exec fluxbox

#vdesk &

#exec ctwm

exec xmonad

#exec scrotwm

#exec evilwm -v vdesk -fg "#222222" -bg "#121212" -bw 2 -term gmrun
#exec evilwm -fg "#121212" -bg "#0f0f0f" -term fbrun
