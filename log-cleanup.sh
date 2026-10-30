#!/bin/bash

# Linux Log Cleanup Automation

LOG_DIR="/var/log"
DAYS=30

echo "================================"
echo "      LINUX LOG CLEANUP"
echo "================================"

# Check root permission
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

echo "Log directory: $LOG_DIR"
echo "Finding log files older than $DAYS days..."

# Show old log files first
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -print

echo ""
read -p "Do you want to delete these files? (yes/no): " answer

if [[ "$answer" == "yes" ]]; then
    find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -delete
    echo "Old log files cleanup completed."
else
    echo "Cleanup cancelled."
fi

echo "Process finished."
