#!/usr/bin/env bash

myopen(){
    local file="$1"
    local mime
    mime=$(file -biL "$file")
    case "$mime" in
        *text*|*empty*|application/json|application/xml)
            alacritty -e "${VISUAL:-nvim}" "$file"
            ;;
        *)
            xdg-open "$file" &>/dev/null &
            ;;
    esac
}

SELECTION=$(cat <<EOF | fuzzel -d
WIFI
Calculator
FZF
EOF
)

case "$SELECTION" in
    "Calculator")
    ans=$(fuzzel -d | bc -l) || exit 0;
    noctalia-shell ipc call toast send "{\"body\": \"$ans\"}";;

    "FZF")
    ans=$(fd -C "/home/akshit/" | fuzzel -d) || exit 0;
    myopen "$ans";;

    "WIFI")
    newsel=$(nmcli -g NAME con show | fuzzel -d) || exit 0;
    nmcli connection up "$newsel";;

    *)
    exit 0 ;;
esac
