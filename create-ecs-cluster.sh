#!/bin/bash

cluster_name="your-cluster-name"
aws ecs create-cluster --cluster-name $cluster_name
