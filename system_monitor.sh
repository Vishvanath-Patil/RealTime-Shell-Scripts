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
