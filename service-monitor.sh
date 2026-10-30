#!/bin/bash

# Linux Service Monitoring Script

echo "===================================="
echo "       LINUX SERVICE MONITOR"
echo "===================================="

# Check root permission
if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

SERVICES=("sshd" "httpd" "mariadb" "firewalld")

for service in "${SERVICES[@]}"; do
    echo ""
    echo "Checking service: $service"

    if systemctl is-active --quiet "$service"; then
        echo "$service : RUNNING"
    else
        echo "$service : NOT RUNNING"
    fi
done

echo ""
echo "Service monitoring completed."
