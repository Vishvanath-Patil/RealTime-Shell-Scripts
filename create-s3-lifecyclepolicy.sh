#!/bin/bash

bucket_name="your-bucket-name"
policy_file="path/to/policy.json"
aws s3api put-bucket-lifecycle-configuration --bucket $bucket_name --lifecycle-configuration file://$policy_file
