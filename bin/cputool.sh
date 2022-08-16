#!/bin/bash
# History:
# 2022/8/15 tobiichi3227 version:1.0
# 2022/8/15 tobiichi3227 version:2.0 add print_value function and fix v1.0 bugs
# 2022/8/16 tobiichi3227 version:2.1 add you know and prompting???
# 2022/8/16 tobiichi3227 version:2.2 fix bug
# 2022/8/17 tobiichi3227 version:2.3 fix bug

# echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
# echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo
# echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null
# echo powersave   | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null
# echo 0  > /sys/devices/system/cpu/cpu*/power/energy_perf_bias # performance
# echo 4  > /sys/devices/system/cpu/cpu*/power/energy_perf_bias # balance_performance
# echo 6  > /sys/devices/system/cpu/cpu*/power/energy_perf_bias # normal
# echo 8  > /sys/devices/system/cpu/cpu*/power/energy_perf_bias # balance_power
# echo 15 > /sys/devices/system/cpu/cpu*/power/energy_perf_bias # power
# echo value > /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
# echo value > /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq

# miyuki is my wife and sister

VERSION="2.3"
cpu_cnt=`cat /proc/cpuinfo | grep "^processor" | wc -l`
ebp_str[0]="performance"
ebp_str[4]="balance_performance"
ebp_str[6]="normal"
ebp_str[8]="balance_power"
ebp_str[15]="power"

function print_help () {
    while read -r line; do
        printf "%s\n" "$line"
    done <<-EOF
    Usage:
	  ${0##*/} [-t <option>] [-g <governor>] [-e <ebp>] [-p <value>]
	  ${0##*/} -h | -v

    Options:
      -t Turn On/Off Intel Trubo Boost (0|1|on|off)
      -g Set Cpu Scaling Governor (powersave|performance)
      -e Set Intel Performance and Energy Bias Hint (performance|balance_performance|normal|balance_power|power)
      -p print current value (governor|ebp|freq|trubo)
	  -h Show help
	  -v Print version number and exit

    Created By tobiichi3227
EOF
}

function print_version () {
    echo "Cputool Version: $VERSION"
    echo "A Useful Cputool"
    echo "Create By tobiichi3227"
}

function set_ebp () {
    local val=-1
    case "$1" in
        performance) val=0;;
        balance_performance) val=4;;
        normal) val=6;;
        balance_power) val=8;;
        power) val=15;;
    esac

    if [[ $val == -1 ]]; then
        echo "Error Ebp: $1"
        echo "Can Use Ebp: (performance|balance_performance|normal|balance_power|power)"
        return 1
    fi

    for ((i = 0; i < $cpu_cnt; i++)); do
        echo "$val">/sys/devices/system/cpu/cpu"$i"/power/energy_perf_bias
    done

}

function set_cpu_scaling_governor () {
    case "$1" in
        performance)
            for ((i = 0; i < $cpu_cnt; i++)); do
                echo "performance">/sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor
            done
            ;;
        powersave)
            for ((i = 0; i < $cpu_cnt; i++)); do
                echo "powersave">/sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor
            done
            ;;
        *)
            echo "Error Governor: $1"
            echo "Can Use Governor: `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors`"
            ;;
    esac
    # echo "Current Governor: `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`"
}

function set_cpu_scaling_freq () {
    case "$1" in
        max_freq) echo $2 > /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq;;
        min_freq) echo $2 > /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq;;
    esac
}

function set_no_turbo () {
    case "$1" in
        0)
            echo $1 > /sys/devices/system/cpu/intel_pstate/no_turbo
            echo "Trubo Is On"
            ;;
        1)
            echo $1 > /sys/devices/system/cpu/intel_pstate/no_turbo
            echo "Trubo Is Off"
            ;;
        on)
            echo "0" > /sys/devices/system/cpu/intel_pstate/no_turbo
            echo "Trubo Is On"
            ;;
        off)
            echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo
            echo "Trubo Is Off"
            ;;
        *) echo "Error Option: $1"
    esac
}

function print_value () {
    case "$1" in
        governor)
            for ((i = 0; i < $cpu_cnt; i++)); do
                echo "Cpu$i current governor: "`cat /sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_governor`
            done
            ;;
        freq)
            local average=0
            local temp=0
            for ((i = 0; i < $cpu_cnt; i++)); do
                temp=`cat /sys/devices/system/cpu/cpu"$i"/cpufreq/scaling_cur_freq`
                average=$(($average+$temp))
                temp=$(printf "%.3f" `echo "scale=3; $temp/1000000" | bc -l`)
                echo "Cpu$i current freq: $temp Ghz"
            done
            average=$(echo "scale=3; $average/$cpu_cnt/1000000" | bc -l)
            echo "Average current freq: $average Ghz"
            ;;
        ebp)
            for ((i = 0; i < $cpu_cnt; i++)); do
                echo "Cpu$i current ebp: ${ebp_str[`cat /sys/devices/system/cpu/cpu"$i"/power/energy_perf_bias`]}"
            done
            ;;
        trubo)
            local trubo_state=`cat /sys/devices/system/cpu/intel_pstate/no_turbo`
            if [[ $trubo_state -eq 0 ]]; then
                echo "Trubo Boost State: On"
            else
                echo "Trubo Boost State: Off"
            fi
            ;;
        *)
            echo "Error Value: $1 !!!"
            echo "Can Print Vaule (governor|ebp|freq|trubo)"
            ;;
    esac
}

function is_root () {
    if [[ $USER != "root" ]]; then
        echo "You should use root to run this script!!!"
        exit 1
    fi
}

while getopts ":e:t:g:p:vh?" OPT; do
    case $OPT in
        e)
            is_root
            set_ebp $OPTARG
            ;;
        t)
            is_root
            set_no_turbo $OPTARG
            ;;
        g)
            is_root
            set_cpu_scaling_governor $OPTARG
            ;;
        p)
            print_value $OPTARG
            exit 1
            ;;
        h)
            print_help
            exit 1
            ;;
        v)
            print_version
            exit 1
            ;;
        \?)
            print_help
            exit 1
            ;;
        :)
            case $OPTARG in
                e)
                    echo "Error about -$OPTARG option, you can use cputool.sh -h to get help"
                    ;;
                t)
                    echo "Error about -$OPTARG option, you can use cputool.sh -h to get help"
                    ;;
                g)
                    echo "Error about -$OPTARG option, you can use cputool.sh -h to get help"
                    ;;
                p)
                    echo "Error about -$OPTARG option, you can use cputool.sh -h to get help"
                    ;;
                *)
                    echo "Unexpected Error"
                    exit 1
                    ;;
            esac
            ;;
    esac
done
