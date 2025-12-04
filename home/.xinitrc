xrandr --output HDMI-A-0 --mode 1920x1080 --rate 100 &
feh --bg-fill ~/dotfiles/asset/wall/crane.png &
picom -b --config ~/dotfiles/home/.config/picom/picom.conf &
dunst &
exec dwm
