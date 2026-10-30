#!/bin/bash

# Linux System Monitoring Script
# Project: Linux Server Administration

echo "======================================"
echo "       LINUX SYSTEM MONITOR"
echo "======================================"

echo ""
echo "SERVER HOSTNAME:"
hostname

echo ""
echo "CURRENT DATE:"
date

echo ""
echo "SYSTEM UPTIME:"
uptime

echo ""
echo "CPU INFORMATION:"
lscpu | grep -E "Model name|CPU\(s\):" | head -2

echo ""
echo "MEMORY USAGE:"
free -h

echo ""
echo "DISK USAGE:"
df -h

echo ""
echo "TOP 5 PROCESSES BY CPU:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -6

echo ""
echo "MONITORING COMPLETED!"
echo "======================================"
