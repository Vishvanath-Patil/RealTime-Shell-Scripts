#!/bin/bash

instance_id="your-instance-id"
aws ec2 start-instances --instance-ids $instance_id
