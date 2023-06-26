#!/bin/bash

group_name="your-group-name"
launch_config_name="your-launch-config-name"
subnet_ids="your-subnet-ids"
min_size="1"
max_size="3"
aws autoscaling create-auto-scaling-group --auto-scaling-group-name $group_name --launch-configuration-name $launch_config_name --min-size $min_size --max-size $max_size --vpc-zone-identifier $subnet_ids
