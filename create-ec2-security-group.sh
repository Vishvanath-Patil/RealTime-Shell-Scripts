#!/bin/bash

group_name="your-group-name"
aws ec2 create-security-group --group-name $group_name --description "My security group"
