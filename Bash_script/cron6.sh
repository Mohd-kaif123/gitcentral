
#------------ PROJECT-3: DevOps Maintenance Script Features  ------------#

#!/bin/bash

# --- CONFIGURATION ---
LOG_DIR="/mnt/d/bash_script/gitcentral/Bash_script"
REPORT_FILE="$LOG_DIR/maintenance_report_$(date "+%Y-%m-%d").md"
SERVICES=("nginx" "docker") # Jo services aapko monitor karni hain

# Report ki Shuruaat (Markdown Format)
echo "# DEVOPS AUTOMATIC MAINTENANCE REPORT" > "$REPORT_FILE"
echo "**Timestamp:** $(date "+%Y-%m-%d %H:%M:%S")" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"

# ==================================================
# 1. SERVICE MONITORING & AUTO-RESTART
# ==================================================
echo "## 1. Service Status Report" >> "$REPORT_FILE"
echo "| Service Name | Status | Action Taken |" >> "$REPORT_FILE"
echo "|--------------|--------|--------------|" >> "$REPORT_FILE"

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "| $SERVICE | ✅ RUNNING | None (All Good) |" >> "$REPORT_FILE"
    else
        # Agar service down hai to restart karne ki koshish karo
        sudo systemctl restart "$SERVICE" 2>/dev/null
        
        # Fir se check karo restart hua ya nahi
        if systemctl is-active --quiet "$SERVICE"; then
            echo "| $SERVICE | ⚠️ RESTARTED | Service was down, auto-restarted successfully |" >> "$REPORT_FILE"
        else
            echo "| $SERVICE | ❌ CRITICAL DOWN | Auto-restart FAILED! Manual check needed |" >> "$REPORT_FILE"
        fi
    fi
done

echo "" >> "$REPORT_FILE"

# ==================================================
# 2. LOG CLEANUP AUTOMATION
# ==================================================
echo "## 2. Log Cleanup Status" >> "$REPORT_FILE"
# 7 din se purane .log files ko delete karna
OLD_LOGS_COUNT=$(find "$LOG_DIR" -type f -name "*.log" -mtime +7 | wc -l)

if [ "$OLD_LOGS_COUNT" -gt 0 ]; then
    find "$LOG_DIR" -type f -name "*.log" -mtime +7 -delete
    echo "✓ Cleaned up **$OLD_LOGS_COUNT** log files older than 7 days from $LOG_DIR." >> "$REPORT_FILE"
else
    echo "✓ No old log files found. Directory is clean." >> "$REPORT_FILE"
fi

echo "" >> "$REPORT_FILE"

# ==================================================
# 3. SYSTEM HEALTH CHECK
# ==================================================
echo "## 3. Infrastructure Health Check" >> "$REPORT_FILE"

# CPU Status
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}%")

# RAM Status
RAM_TOTAL=$(free -m | awk 'NR==2{print $2}')
RAM_USED=$(free -m | awk 'NR==2{print $3}')
RAM_PCT=$(awk "BEGIN {printf \"%.2f%%\", ($RAM_USED / $RAM_TOTAL) * 100}")

# Disk Status
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

echo "* **CPU Usage:** $CPU_USAGE" >> "$REPORT_FILE"
echo "* **RAM Usage:** $RAM_USED MB / $RAM_TOTAL MB ($RAM_PCT)" >> "$REPORT_FILE"
echo "* **Disk Space (Root):** $DISK_USAGE" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "=================================================="
echo "Maintenance completed! Report generated at: $REPORT_FILE"