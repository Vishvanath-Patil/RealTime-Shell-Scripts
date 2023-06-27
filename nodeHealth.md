Title: System Health Monitoring Script (v1)

Author: Vishvanath Patil

Date: June 27, 2023

Description:
This script is designed to monitor the health of a system. It provides important system information and utilizes various commands to gather data for analysis. The script is intended to help administrators or users assess the overall health and resource usage of their system.

Usage:
The script utilizes the following commands to gather system information:

df -h: This command displays the disk space usage of file systems on the system. It provides information about the total, used, and available disk space for each mounted file system.

free -g: This command shows the amount of free and used memory (RAM) in the system, displayed in gigabytes (GB). It provides information about the total, used, and free memory, as well as the shared, buffered, and cached memory.

nproc: This command displays the number of processing units available on the system. It provides the total count of available CPU cores.

ps -ef | grep root | awk -F " " '{print 2$}': This command lists the currently running processes on the system and filters out the processes owned by the root user. It uses the grep command to find lines containing the word "root" and the awk command to extract the second field (the process ID) from the output.

The script is executed with the following settings:

Debug Mode: The set -x command enables debug mode, which displays each command being executed in the script. This can be helpful for troubleshooting and understanding the script's flow.

Error Handling: The set -e command ensures that the script exits immediately if any command encounters an error. This helps prevent further execution in case of unexpected failures.

Pipe Failure Handling: The set -o pipefail command ensures that if any command within a pipeline fails, the script will also fail. This allows for more accurate error detection and handling.

Please note that this script is version 1 (v1) and may be subject to future updates or improvements.





