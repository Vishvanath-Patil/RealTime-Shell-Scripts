#!/bin/bash

function_name="your-function-name"
runtime="your-runtime"
handler="your-handler"
role_arn="your-role-arn"
zip_file="path/to/function.zip"
aws lambda create-function --function-name $function_name --runtime $runtime --role $role_arn --handler $handler --zip-file fileb://$zip_file
