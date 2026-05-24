#!/bin/bash
#------------ Cron + Cleanup Automation ------------#

LOG_FILE="/mnt/d/bash_script/gitcentral/Bash_script/cleanup.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "--- Cleanup Started at $TIMESTAMP ---" >> "$LOG_FILE"

# 1. Temp Files Delete karna (Jo files 2 din se purani hain /tmp me)
find /tmp -type f -atime +2 -delete 2>/dev/null
echo "1. Temporary files cleaned." >> "$LOG_FILE"

# 2. Linux Memory Cache Clear karna (Iske liye sudo/root power chahiye)
# 'sync' memory ka data disk par write karta hai, 'drop_caches' cache khali karta hai
sync && echo 3 > /proc/sys/vm/drop_caches 2>/dev/null
echo "2. System memory cache cleared." >> "$LOG_FILE"

# 3. Old Backups Remove karna (Jo backups 30 din se zyada purane hain)
# Maan lijiye aapke backups '/mnt/d/bash_script/gitcentral/Bash_script/db_backups' me hain
BACKUP_DIR="/mnt/d/bash_script/gitcentral/Bash_script/db_backups"
if [ -d "$BACKUP_DIR" ]; then
    find "$BACKUP_DIR" -type f -name "*.sql" -mtime +30 -delete
    echo "3. Backups older than 30 days removed from $BACKUP_DIR." >> "$LOG_FILE"
else
    echo "3. Backup directory not found, skipping." >> "$LOG_FILE"
fi

echo "--- Cleanup Completed ---" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"


#------------ PROJECT-1: Lonux monitoring Tool  ------------#

# --- CONFIGURATION (THRESHOLDS) ---
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=85
LOG_FILE="/mnt/d/bash_script/gitcentral/Bash_script/system_monitor.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "=================================================="
echo " SYSTEM MONITORING REPORT - $TIMESTAMP "
echo "=================================================="

# 1. CPU MONITORING
# Idle % nikal kar 100 se minus karenge to Used % milega
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}")
CPU_INT=${CPU_USAGE%.*} # Decimal ko Integer (integer) me badla comparison ke liye

echo "CPU Usage    : $CPU_USAGE%"
if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "⚠️ [ALERT] CPU Usage is critically high: $CPU_USAGE%" | tee -a "$LOG_FILE"
fi

# 2. RAM MONITORING
RAM_TOTAL=$(free -m | awk 'NR==2{print $2}')
RAM_USED=$(free -m | awk 'NR==2{print $3}')
RAM_USAGE_PCT=$(awk "BEGIN {print ($RAM_USED / $RAM_TOTAL) * 100}")
RAM_INT=${RAM_USAGE_PCT%.*}

echo "RAM Usage    : $RAM_USED MB / $RAM_TOTAL MB (${RAM_USAGE_PCT%.*}%)"
if [ "$RAM_INT" -gt "$RAM_THRESHOLD" ]; then
    echo "⚠️ [ALERT] RAM Usage is critically high: ${RAM_USAGE_PCT%.*}%" | tee -a "$LOG_FILE"
fi

# 3. DISK MONITORING (Root '/' Partition)
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
DISK_INT=${DISK_USAGE%%} # '%' sign hatakar sirf number nikalna

echo "Disk Usage   : $DISK_USAGE"
if [ "$DISK_INT" -gt "$DISK_THRESHOLD" ]; then
    echo "⚠️ [ALERT] Disk Space is running out: $DISK_USAGE" | tee -a "$LOG_FILE"
fi

# 4. NETWORK MONITORING
# Rx (Receive) aur Tx (Transmit) bytes packets check karna (eth0 ya wlan0 ya enp0s3 ke liye)
# Hum default interface ka naam nikalenge
INTERFACE=$(ip route | grep default | awk '{print $5}')
if [ -z "$INTERFACE" ]; then
    INTERFACE="lo" # Agar koi active network nahi hai to loopback
fi

RX_BYTES_1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_BYTES_1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1 # 1 second wait karenge speed calculate karne ke liye
RX_BYTES_2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_BYTES_2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Speed in KB/s
RX_SPEED=$(( (RX_BYTES_2 - RX_BYTES_1) / 1024 ))
TX_SPEED=$(( (TX_BYTES_2 - TX_BYTES_1) / 1024 ))

echo "Network ($INTERFACE): Download: $RX_SPEED KB/s | Upload: $TX_SPEED KB/s"
echo "=================================================="