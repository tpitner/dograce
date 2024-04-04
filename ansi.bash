# ANSI utils
u() { # underline $1
    echo "\033[4m$1\033[0m"
} 
yellow() {
    echo "\033[93m$1\033[0m"
}
green() {
    echo -e "\033[92m$1\033[0m"
}
red() {
    echo -e "\033[91m$1\033[0m"
}
magenta() {
    echo "\033[95m$1\033[0m"
}
blue() {
    echo "\033[34m$1\033[0m"
}
hilite() { 
    echo $(magenta "$1") 
}
clear_line() {
    echo -ne "\r\033[K"
}

: <<'END'
Foreground (Text) Colors

    Default: \033[39m
    Black: \033[30m
    Red: \033[31m
    Green: \033[32m
    Yellow: \033[33m
    Blue: \033[34m
    Magenta: \033[35m
    Cyan: \033[36m
    Light Gray: \033[37m
    Dark Gray: \033[90m
    Light Red: \033[91m
    Light Green: \033[92m
    Light Yellow: \033[93m
    Light Blue: \033[94m
    Light Magenta: \033[95m
    Light Cyan: \033[96m
    White: \033[97m

Background Colors

    Default Background: \033[49m
    Black Background: \033[40m
    Red Background: \033[41m
    Green Background: \033[42m
    Yellow Background: \033[43m
    Blue Background: \033[44m
    Magenta Background: \033[45m
    Cyan Background: \033[46m
    Light Gray Background: \033[47m
    Dark Gray Background: \033[100m
    Light Red Background: \033[101m
    Light Green Background: \033[102m
    Light Yellow Background: \033[103m
    Light Blue Background: \033[104m
    Light Magenta Background: \033[105m
    Light Cyan Background: \033[106m
    White Background: \033[107m
END