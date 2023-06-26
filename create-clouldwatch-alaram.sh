#!/bin/bash

alarm_name="your-alarm-name"
metric_name="your-metric-name"
namespace="your-namespace"
threshold="your-threshold"
comparison_operator="GreaterThanOrEqualToThreshold"
evaluation_periods="2"
period="60"
aws cloudwatch put-metric-alarm --alarm-name $alarm_name --metric-name $metric_name --namespace $namespace --comparison-operator $comparison_operator --evaluation-periods $evaluation_periods --period $period --threshold $threshold --alarm-actions "your-sns-topic-arn"
