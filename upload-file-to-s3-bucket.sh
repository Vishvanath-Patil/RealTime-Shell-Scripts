#!/bin/bash

bucket_name="your-bucket-name"
file_path="path/to/file"
aws s3 cp $file_path s3://$bucket_name
