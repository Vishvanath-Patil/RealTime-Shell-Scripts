#!/bin/bash

key_name="your-key-name"
aws ec2 create-key-pair --key-name $key_name --query 'KeyMaterial' --output text > $key_name.pem
chmod 400 $key_name.pem
