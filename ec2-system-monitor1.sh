#!/bin/bash

# Function to calculate CPU usage
calculate_cpu_usage() {
  instance_id=$1
  cpu_usage=$(aws cloudwatch get-metric-statistics --namespace "AWS/EC2" --metric-name "CPUUtilization" --dimensions "Name=InstanceId,Value=$instance_id" --start-time "$(date -u +%Y-%m-%dT%H:%M:%SZ --date '5 minutes ago')" --end-time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --period 300 --statistics "Average" --query "Datapoints[0].Average")
  echo "CPU Usage for instance $instance_id: $cpu_usage"
}

# Function to calculate memory usage
calculate_memory_usage() {
  instance_id=$1
  memory_usage=$(aws cloudwatch get-metric-statistics --namespace "AWS/EC2" --metric-name "MemoryUtilization" --dimensions "Name=InstanceId,Value=$instance_id" --start-time "$(date -u +%Y-%m-%dT%H:%M:%SZ --date '5 minutes ago')" --end-time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --period 300 --statistics "Average" --query "Datapoints[0].Average")
  echo "Memory Usage for instance $instance_id: $memory_usage"
}

# Function to calculate disk usage
calculate_disk_usage() {
  instance_id=$1
  disk_usage=$(aws cloudwatch get-metric-statistics --namespace "AWS/EC2" --metric-name "DiskSpaceUtilization" --dimensions "Name=InstanceId,Value=$instance_id" --start-time "$(date -u +%Y-%m-%dT%H:%M:%SZ --date '5 minutes ago')" --end-time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --period 300 --statistics "Average" --query "Datapoints[0].Average")
  echo "Disk Usage for instance $instance_id: $disk_usage"
}

# Main script
instance_id="your-instance-id"
calculate_cpu_usage $instance_id
calculate_memory_usage $instance_id
calculate_disk_usage $instance_id
