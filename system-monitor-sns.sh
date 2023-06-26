#!/bin/bash

# Function to calculate CPU usage
calculate_cpu_usage() {
  instance_id=$1
  cpu_usage=$(aws cloudwatch get-metric-statistics --namespace "AWS/EC2" --metric-name "CPUUtilization" --dimensions "Name=InstanceId,Value=$instance_id" --start-time "$(date -u +%Y-%m-%dT%H:%M:%SZ --date '5 minutes ago')" --end-time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --period 300 --statistics "Average" --query "Datapoints[0].Average")
  echo "CPU Usage for instance $instance_id: $cpu_usage"

  # Check if CPU usage is above 50%
  if [ $(echo "$cpu_usage >= 50" | bc -l) -eq 1 ]; then
    send_notification "CPU Usage" "$instance_id"
  fi
}

# Function to calculate memory usage
calculate_memory_usage() {
  instance_id=$1
  memory_usage=$(aws cloudwatch get-metric-statistics --namespace "AWS/EC2" --metric-name "MemoryUtilization" --dimensions "Name=InstanceId,Value=$instance_id" --start-time "$(date -u +%Y-%m-%dT%H:%M:%SZ --date '5 minutes ago')" --end-time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --period 300 --statistics "Average" --query "Datapoints[0].Average")
  echo "Memory Usage for instance $instance_id: $memory_usage"

  # Check if memory usage is above 50%
  if [ $(echo "$memory_usage >= 50" | bc -l) -eq 1 ]; then
    send_notification "Memory Usage" "$instance_id"
  fi
}

# Function to calculate disk usage
calculate_disk_usage() {
  instance_id=$1
  disk_usage=$(aws cloudwatch get-metric-statistics --namespace "AWS/EC2" --metric-name "DiskSpaceUtilization" --dimensions "Name=InstanceId,Value=$instance_id" --start-time "$(date -u +%Y-%m-%dT%H:%M:%SZ --date '5 minutes ago')" --end-time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --period 300 --statistics "Average" --query "Datapoints[0].Average")
  echo "Disk Usage for instance $instance_id: $disk_usage"

  # Check if disk usage is above 50%
  if [ $(echo "$disk_usage >= 50" | bc -l) -eq 1 ]; then
    send_notification "Disk Usage" "$instance_id"
  fi
}

# Function to send notification email
send_notification() {
  subject=$1
  instance_id=$2
  message="$subject for instance $instance_id has reached 50% or more."

  echo "$message" | mail -s "$subject Alert" pvishva932@gmail.com
}

# Main script
instance_ids=$(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --output text)

for instance_id in $instance_ids; do
  echo "Instance ID: $instance_id"
  calculate_cpu_usage $instance_id
  calculate_memory_usage $instance_id
  calculate_disk_usage $instance_id
  echo "--------------------------------------------------"
done
