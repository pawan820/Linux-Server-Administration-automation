#!/bin/bash

# Linux User Management Automation
# Project: Linux Server Administration

echo "=================================="
echo "   LINUX USER MANAGEMENT TOOL"
echo "=================================="

# Check root permission
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root."
    exit 1
fi

echo "1. Create User"
echo "2. Create Group"
echo "3. Add User to Group"
echo "4. Check User"
echo "5. Exit"

read -p "Enter your choice: " choice

case $choice in
    1)
        read -p "Enter username: " username

        if id "$username" &>/dev/null; then
            echo "User already exists."
        else
            useradd "$username"
            echo "User $username created successfully."
        fi
        ;;

    2)
        read -p "Enter group name: " groupname

        if getent group "$groupname" >/dev/null; then
            echo "Group already exists."
        else
            groupadd "$groupname"
            echo "Group $groupname created successfully."
        fi
        ;;

    3)
        read -p "Enter username: " username
        read -p "Enter group name: " groupname

        if id "$username" &>/dev/null &&
           getent group "$groupname" >/dev/null; then
            usermod -aG "$groupname" "$username"
            echo "User added to group successfully."
        else
            echo "User or group does not exist."
        fi
        ;;

    4)
        read -p "Enter username: " username

        if id "$username" &>/dev/null; then
            id "$username"
        else
            echo "User does not exist."
        fi
        ;;

    5)
        echo "Exiting..."
        exit 0
        ;;

    *)
        echo "Invalid choice."
        ;;
esac
