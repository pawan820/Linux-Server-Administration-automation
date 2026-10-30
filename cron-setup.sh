#!/bin/bash

# Linux Cron Job Automation

SCRIPT_PATH="/opt/linux-admin/system-monitor.sh"
LOG_FILE="/var/log/system-monitor.log"
CRON_JOB="0 9 * * * $SCRIPT_PATH >> $LOG_FILE 2>&1"

echo "================================"
echo "       CRON JOB SETUP"
echo "================================"

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

if [[ ! -x "$SCRIPT_PATH" ]]; then
    echo "Monitoring script not found or not executable:"
    echo "$SCRIPT_PATH"
    exit 1
fi

# Add cron job only if it does not already exist
( crontab -l 2>/dev/null | grep -Fv "$SCRIPT_PATH"; echo "$CRON_JOB" ) | crontab -

echo "Daily monitoring scheduled at 9:00 AM."
echo "Cron job details:"
crontab -l
