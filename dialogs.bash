quick_menu() { # prompt var; does NOT wait for Enter 
    echo -ne $1
    read -n 1 -s $2
    clear_line
}
last_confirm=N
confirm() { # does NOT wait for Enter 
    echo -ne $1
    read -n 1 -s last_confirm
    clear_line
}
menu() { # prompt var; waits for Enter
    echo -ne $1
    read $2
}
ok() {
    green " OK"
}
