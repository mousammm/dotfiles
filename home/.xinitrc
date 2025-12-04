xrandr --output HDMI-A-0 --mode 1920x1080 --rate 100 &
~/.fehbg &
picom -b --config ~/dotfiles/home/.config/picom/picom.conf &
~/dotfiles/scripts/status-bar.sh &
dunst &
exec dwm
