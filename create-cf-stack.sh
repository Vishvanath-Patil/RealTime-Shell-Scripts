#!/bin/bash

stack_name="your-stack-name"
template_file="path/to/template.yml"
aws cloudformation create-stack --stack-name $stack_name --template-body file://$template_file --capabilities CAPABILITY_IAM
