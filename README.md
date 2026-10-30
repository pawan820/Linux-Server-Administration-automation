Linux Server Administration & Automation

Project Overview

This project contains Bash scripts designed to automate common Linux server administration tasks. It is created for Linux system administration practice using Red Hat Enterprise Linux (RHEL).

Features

1. User Management – Create users, create groups, add users to groups, and check user details.
2. System Monitoring – Monitor hostname, uptime, CPU, memory, disk usage, and top processes.
3. Automatic Backup – Create timestamped compressed backups of the "/etc" directory.
4. Log Cleanup – Find and delete log files older than 30 days after confirmation.
5. Service Monitoring – Check the status of SSH, Apache, MariaDB, and firewalld services.
6. Cron Automation – Schedule the system monitoring script to run daily at 9:00 AM.

Technologies Used

- Red Hat Enterprise Linux (RHEL)
- Linux
- Bash Shell Scripting
- systemd
- Cron

Project Structure

linux-server-administration-automation/
├── user-management.sh
├── system-monitor.sh
├── backup.sh
├── log-cleanup.sh
├── service-monitor.sh
├── cron-setup.sh
└── README.md

Requirements

- RHEL 10 or compatible Linux distribution
- Bash shell
- Root or sudo privileges for administrative scripts
- Required Linux utilities such as tar and systemctl

How to Use

Clone the repository:

git clone https://github.com/pawan820/linux-server-administration-automation.git

Open the project directory:

cd linux-server-administration-automation

Give execute permission:

chmod +x *.sh

Run the scripts:

sudo ./user-management.sh
./system-monitor.sh
sudo ./backup.sh
sudo ./log-cleanup.sh
sudo ./service-monitor.sh

Cron Job Setup

The cron setup script expects the monitoring script at:

/opt/linux-admin/system-monitor.sh

Prepare the script:

sudo mkdir -p /opt/linux-admin
sudo cp system-monitor.sh /opt/linux-admin/
sudo chmod +x /opt/linux-admin/system-monitor.sh

Then run:

sudo ./cron-setup.sh

This schedules the monitoring script to run daily at 9:00 AM using root's crontab.

Safety Notes

- Run scripts in a test environment before using them on production servers.
- Review log files carefully before deleting them.
- Protect backup archives because "/etc" may contain sensitive configuration information.
- Use sudo only when required.

Author

Pawan Anil Mohite

GitHub: https://github.com/pawan820
