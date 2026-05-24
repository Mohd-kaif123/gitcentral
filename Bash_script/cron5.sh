#!/bin/bash


#------------ PROJECT-1: Auto Backup System ------------#

# --- CONFIGURATION ---
SRC_DIR="/mnt/d/bash_script/gitcentral" # Jiska backup lena hai
BACKUP_DIR="/mnt/d/bash_script/gitcentral/Bash_script/all_backups" # Jaha backup save karna hai
LOG_FILE="/mnt/d/bash_script/gitcentral/Bash_script/backup_system.log"
RETENTION_DAYS=15 # Kitne din purane backups delete karne hain

TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "=== Backup Process Started at $(date "+%Y-%m-%d %H:%M:%S") ===" >> "$LOG_FILE"

# 1. Backup Folder check karo, nahi hai toh banao
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "[INFO] Backup directory created: $BACKUP_DIR" >> "$LOG_FILE"
fi

# 2. COMPRESSION (Tar command se zip/compress karna)
# --exclude lagaya hai taaki backups ke andar backups dubara na save ho jayein
tar -czf "$BACKUP_FILE" --exclude="$BACKUP_DIR" "$SRC_DIR" 2>> "$LOG_FILE"

# Check backup success or failure
if [ $? -eq 0 ]; then
    FILE_SIZE=$(du -sh "$BACKUP_FILE" | awk '{print $1}')
    echo "[SUCCESS] Backup created successfully: backup_$TIMESTAMP.tar.gz (Size: $FILE_SIZE)" >> "$LOG_FILE"
else
    echo "[ERROR] Backup compression FAILED!" >> "$LOG_FILE"
fi

# 3. OLD BACKUP CLEANUP (Retention policy)
echo "[INFO] Checking for backups older than $RETENTION_DAYS days..." >> "$LOG_FILE"

# Pehle check karenge ki purani files hain ya nahi
OLD_FILES_COUNT=$(find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS | wc -l)

if [ "$OLD_FILES_COUNT" -gt 0 ]; then
    # Purane backups delete karenge
    find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -delete
    echo "[CLEANUP] Deleted $OLD_FILES_COUNT old backup file(s)." >> "$LOG_FILE"
else
    echo "[CLEANUP] No old backups found to delete." >> "$LOG_FILE"
fi

echo "=== Backup Process Completed ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"