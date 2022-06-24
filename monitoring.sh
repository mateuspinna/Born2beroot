#!/bin/bash

Architecture=$(uname -a)
CPU=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
vCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
MEMUSAGE=$(free -m | grep "Mem:" | awk '{printf $3"/"$2"MB " "(%.3g%%)", $3/$2*100}')
DISKUSAGE=$(df -BM | awk '{totalsize += $2} {usedsize += $4} END {printf usedsize"/" "%.0f", totalsize/1000} END {printf "Gb (%.0f%%)", usedsize/totalsize*100}')
CPULOAD=$(top -n1 | grep "Cpu(s):" | awk '{printf "%.1f%%", $2}')
LASTBOOT=$(who -b | awk '{printf $3 " " $4}')

wall "#Architecture: ${Architecture}
#CPU physical : $CPU
#vCPU : $vCPU
#Memory Usage: $MEMUSAGE
#Disk Usage: $DISKUSAGE
#CPU Load: $CPULOAD
#Last boot: $LASTBOOT
"
