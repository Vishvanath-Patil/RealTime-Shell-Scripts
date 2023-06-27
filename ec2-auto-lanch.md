In this script, if-else statements are used to perform the following tasks:

It checks if the AWS CLI is installed. If not, it displays an error message and exits.

It checks if the specified security group exists. If it doesn't exist, it creates the security group and displays a success message. Otherwise, it displays a message indicating that the security group already exists.

It checks if the specified key pair exists. If it doesn't exist, it creates the key pair, saves it to a .pem file, sets the appropriate permissions, and displays a success message. Otherwise, it displays a message indicating that the key pair already exists.

It checks if the specified AMI ID exists. If it doesn't exist, it displays an error message and exits.

If all the conditions pass, it deploys an EC2 instance using the specified parameters.

It tags the EC2 instance with a name.

It waits for the EC2 instance to be in the running state.

It uploads a file (my-file.txt) to an S3 bucket specified by AWS_S3_BUCKET.

Finally, it displays a success message indicating that the script execution has completed.

Feel free to customize the script by modifying the AWS variables and adding or modifying conditional statements as per your specific requirements.





