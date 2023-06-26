#!/bin/bash

role_name="your-role-name"
aws iam create-role --role-name $role_name --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'
