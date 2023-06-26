#!/bin/bash

table_name="your-table-name"
attribute_definitions='[{"AttributeName":"id","AttributeType":"N"}]'
key_schema='[{"AttributeName":"id","KeyType":"HASH"}]'
aws dynamodb create-table --table-name $table_name --attribute-definitions $attribute_definitions --key-schema $key_schema --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
