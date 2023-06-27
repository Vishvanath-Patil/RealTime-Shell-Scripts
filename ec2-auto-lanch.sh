#!/bin/bash
# Author: DevOps Engineer
# Date: 27-06-2023
# Description: AWS Deployment Script with Conditional Statements

# Define AWS variables
AWS_REGION="us-east-1"
AWS_INSTANCE_TYPE="t2.micro"
AWS_SECURITY_GROUP="my-security-group"
AWS_KEY_PAIR="my-key-pair"
AWS_AMI_ID="ami-12345678"
AWS_S3_BUCKET="my-s3-bucket"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and configure your credentials."
    exit 1
fi

# Check if the security group exists
if ! aws ec2 describe-security-groups --region "$AWS_REGION" --group-names "$AWS_SECURITY_GROUP" >/dev/null 2>&1; then
    echo "Security group $AWS_SECURITY_GROUP does not exist. Creating the security group..."
    aws ec2 create-security-group --region "$AWS_REGION" --group-name "$AWS_SECURITY_GROUP" --description "My Security Group"
    echo "Security group $AWS_SECURITY_GROUP created successfully."
else
    echo "Security group $AWS_SECURITY_GROUP already exists."
fi

# Check if the key pair exists
if ! aws ec2 describe-key-pairs --region "$AWS_REGION" --key-names "$AWS_KEY_PAIR" >/dev/null 2>&1; then
    echo "Key pair $AWS_KEY_PAIR does not exist. Creating the key pair..."
    aws ec2 create-key-pair --region "$AWS_REGION" --key-name "$AWS_KEY_PAIR" --output text --query 'KeyMaterial' > "$AWS_KEY_PAIR.pem"
    chmod 400 "$AWS_KEY_PAIR.pem"
    echo "Key pair $AWS_KEY_PAIR created successfully."
else
    echo "Key pair $AWS_KEY_PAIR already exists."
fi

# Check if the AMI ID exists
if ! aws ec2 describe-images --region "$AWS_REGION" --image-ids "$AWS_AMI_ID" >/dev/null 2>&1; then
    echo "AMI $AWS_AMI_ID does not exist. Please specify a valid AMI ID."
    exit 1
fi

# Deploy an EC2 instance
echo "Deploying EC2 instance..."
instance_id=$(aws ec2 run-instances --region "$AWS_REGION" \
                --image-id "$AWS_AMI_ID" \
                --instance-type "$AWS_INSTANCE_TYPE" \
                --security-groups "$AWS_SECURITY_GROUP" \
                --key-name "$AWS_KEY_PAIR" \
                --output text --query 'Instances[0].InstanceId')

echo "EC2 instance $instance_id has been deployed successfully."

# Tag the EC2 instance
aws ec2 create-tags --region "$AWS_REGION" \
    --resources "$instance_id" \
    --tags Key=Name,Value=MyInstance

echo "Tags have been applied to the EC2 instance."

# Wait for the EC2 instance to be in the running state
echo "Waiting for the EC2 instance to be in the running state..."
aws ec2 wait instance-running --region "$AWS_REGION" --instance-ids "$instance_id"

echo "EC2 instance is now running."

# Upload a file to S3 bucket
echo "Uploading file to S3 bucket..."
aws s3 cp my-file.txt s3://"$AWS_S3_BUCKET"/

echo "File has been uploaded to the S3 bucket."

echo "Script execution completed successfully."
