#!/bin/bash

clear
echo "======================================================="
echo "                SERVER HEALTH REPORT                   "
echo "======================================================="
echo "Date & Time : $(date)"
echo "Host Name : $(hostname)"
echo "======================================================="

# 1. UPTIME: Server kab se chalu hai
echo "[1] SYSTEM UPTIME:"
# uptime ka output lamba hota hai, par awk se humne sirf uska 3rd aur 4th column uthaya,
# jo hame direct batata hai ki server kitni der se up hai (jaise 4:28, 1 user).
uptime | awk '{print "server up time:", $3, $4}'

# 2. CPU USAGE: CPU kitna use ho taha hai
echo -e "[2] CPU USAGE:"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100 - $8)}')
echo "Current CPU Usage: $CPU_USAGE%"

# 3. RAM USAGE: Memory status ( Total vs Used )
echo -e "[3] RAM USAGE (in MB):"
free -m | grep -E 'total|Mem:' | awk '{print int(100 - $8)}'
    #NR==1 {print $1, $2, $3}
    #NR==2 {print "Total: " $2 "MB | Used: " $3 "MB | Free: " $4 "MB"}

# 4. DISK USAGE: Storage status
echo -e "\n[4] DISK USAGE:"
df -h | grep -E "Filesystem|/$"

# 5. Top 5 PROCESSES: sabse zyada RAM/CPU khane wale top 5 process
echo -e "\n[5] TOP 5 RESOURCES CONSUMING PROCESSES:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo "==================================================="
echo "            REPORT GENERATION COMPLETED            "
echo "==================================================="
