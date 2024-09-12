#!/bin/bash

CSV_FILE="/var/log/cpu_memory_usage.csv"

get_timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
}

collect_usage() {
    TIMESTAMP=$(get_timestamp)

    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

    MEMORY_TOTAL=$(free -m | awk 'NR==2{print $2}')
    MEMORY_USED=$(free -m | awk 'NR==2{print $3}')

    if [ ! -f $CSV_FILE ]; then
        echo "Timestamp,CPU_Usage(%),Memory_Used(MB),Memory_Total(MB)" > $CSV_FILE
    fi
    echo "$TIMESTAMP,$CPU_USAGE,$MEMORY_USED,$MEMORY_TOTAL" >> $CSV_FILE
}

collect_usage