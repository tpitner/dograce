#!/usr/bin/env bash
# Time utils
# Convert times to millis
to_millis() {
    local time_str=$1
    # "11:33:55.000000"
    local regex_time_long="^[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{6}$"
    # "11:33:55.6"
    local regex_time_mid="^[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{1}$"
    # "33:55.6"
    local regex_time_midd="^[0-9]{2}:[0-9]{2}\.[0-9]{1}$"
    # "11:33:55"
    local regex_time_short="^[0-9]{2}:[0-9]{2}:[0-9]{2}$"
    if [[ $time_str =~ $regex_time_long ]]; then
        local hh=10#${time_str:0:2}
        local mm=10#${time_str:3:2}
        local ss=10#${time_str:6:2}
        local mmm=10#${time_str:9:3}
        echo $(( (((($hh * 60) + $mm) * 60) + $ss) * 1000 + $mmm ))
    elif [[ $time_str =~ $regex_time_mid ]]; then  
        local hh=10#${time_str:0:2}
        local mm=10#${time_str:3:2}
        local ss=10#${time_str:6:2}
        local d=10#${time_str:9:1} 
        echo $(( (((($hh * 60) + $mm) * 60) + $ss) * 1000 + $d * 100 ))
    elif [[ $time_str =~ $regex_time_midd ]]; then  
        local mm=10#${time_str:0:2}
        local ss=10#${time_str:3:2}
        local d=10#${time_str:6:1} 
        echo $(( (($mm * 60) + $ss) * 1000 + $d * 100 ))
    elif [[ $time_str =~ $regex_time_short ]]; then  
        local hh=10#${time_str:0:2}
        local mm=10#${time_str:3:2}
        local ss=10#${time_str:6:2}
        echo $(( (((($hh * 60) + $mm) * 60) + $ss) * 1000))
    else
        echo 0
    fi
}
# Convert millis to hh:mm:ss,ddd
to_hh_mm_ss_ddd() {
    local total_ms=$1
    local hours=$(printf "%02d" $((total_ms / 3600000)))
    local minutes=$(printf "%02d" $((total_ms / 60000)))
    local seconds=$(printf "%02d" $((total_ms / 1000 % 60)))
    local ms=$(printf "%01d" $((total_ms % 1000)))
    echo "${hours}:${minutes}:${seconds}.${ms}"
}
# Convert millis to mm:ss.ddd
to_mm_ss_ddd() {
    local total_ms=$1
    local minutes=$(printf "%02d" $((total_ms / 60000)))
    local seconds=$(printf "%02d" $((total_ms / 1000 % 60)))
    local ms=$(printf "%01d" $((total_ms % 1000)))
    echo "${minutes}:${seconds}.${ms}"
}
# Convert millis to hh:mm:ss.d
to_hh_mm_ss_d() {
    local total_ms=$1
    local hours=$(printf "%02d" $((total_ms / 3600000)))
    local minutes=$(printf "%02d" $((total_ms / 60000)))
    local seconds=$(printf "%02d" $((total_ms / 1000 % 60)))
    local ds=$(printf "%01d" $((total_ms / 100 % 10)))
    echo "${hours}:${minutes}:${seconds}.${ds}"
}
# Convert millis to mm:ss.d
to_mm_ss_d() {
    local total_ms=$1
    local minutes=$(printf "%02d" $((total_ms / 60000)))
    local seconds=$(printf "%02d" $((total_ms / 1000 % 60)))
    local ds=$(printf "%01d" $((total_ms / 100 % 10)))
    echo "${minutes}:${seconds}.${ds}"
}

# Get current time in millis
time_to_ms() {
    local datetime=$1
    to_millis "${datetime:0:15}"
}
now_time() {
    gdate +%H:%M:%S.%N
}
now_ms() {
    time_to_ms "$(now_time)"
}