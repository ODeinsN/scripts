width=$1
height=$2
refreshrate=$3
port=$4

mode=$(cvt $width $height $refreshrate | tail -1 | cut -f 2- -d ' ')
modeName=$(echo $mode | cut -f 1 -d ' ')

xrandr --newmode $mode 
xrandr --addmode $port $modeName
