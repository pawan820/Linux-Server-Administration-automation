#!/bin/bash

# Linux Automatic Backup Script

SOURCE_DIR="/etc"
BACKUP_DIR="/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "================================"
echo "     LINUX BACKUP AUTOMATION"
echo "================================"

# Check root permission
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Create compressed backup
tar -czf "$BACKUP_DIR/etc-backup-$DATE.tar.gz" "$SOURCE_DIR"

if [[ $? -eq 0 ]]; then
    echo "Backup completed successfully!"
    echo "Backup location: $BACKUP_DIR"
else
    echo "Backup failed!"
    exit 1
fi

echo "Backup process finished."
