#!/bin/bash

db_instance_id="your-db-instance-id"
db_engine="your-db-engine"
db_instance_class="db-instance-class"
aws rds create-db-instance --db-instance-identifier $db_instance_id --engine $db_engine --db-instance-class $db_instance_class
