#Example of a shell script that monitors system CPU, RAM, and disk usage:
=========================================================================
#!/bin/bash

# Function to calculate CPU usage
calculate_cpu_usage() {
  cpu_usage=$(top -bn1 | awk 'NR>7{s+=$9} END {print s "%"}')
  echo "CPU Usage: $cpu_usage"
}

# Function to calculate RAM usage
calculate_ram_usage() {
  ram_usage=$(free | awk '/Mem/{printf "%.2f%\n", $3/$2*100}')
  echo "RAM Usage: $ram_usage"
}

# Function to calculate disk usage
calculate_disk_usage() {
  disk_usage=$(df -h | awk '$NF=="/"{printf "%s\n", $5}')
  echo "Disk Usage: $disk_usage"
}

# Main script
while true; do
  echo "=============================="
  echo "System Monitoring"
  echo "=============================="
  calculate_cpu_usage
  calculate_ram_usage
  calculate_disk_usage
  echo "=============================="
  echo "Monitoring Complete"
  echo "=============================="
  sleep 5  # Interval between each monitoring check (in seconds)
done

# Save the above script to a file (e.g., system_monitor.sh), make it executable (chmod +x system_monitor.sh), and then run it (./system_monitor.sh). The script will continuously monitor the system's CPU usage, RAM usage, and disk usage in an infinite loop with a 5-second interval between each check.

Please note that this script provides a basic example of system monitoring and may need customization based on your specific requirements or the tools available on your system.
