# Example of a shell script that monitors system CPU, RAM, and disk usage:

Save the above script to a file (e.g., system_monitor.sh), make it executable (chmod +x system_monitor.sh), and then run it (./system_monitor.sh). The script will continuously monitor the system's CPU usage, RAM usage, and disk usage in an infinite loop with a 5-second interval between each check.

Please note that this script provides a basic example of system monitoring and may need customization based on your specific requirements or the tools available on your system.

To run the shell scripts provided, you need to ensure that the following prerequisites are met:
===============================================================================================

AWS CLI: The AWS Command Line Interface (CLI) must be installed on your system. You can download and install it from the official AWS CLI documentation (https://aws.amazon.com/cli/). Make sure you have configured the AWS CLI with the necessary access credentials using the aws configure command.

Shell Environment: The scripts are written in Bash, so you should have a Bash-compatible shell installed on your system (e.g., Bash, Zsh). Most Linux distributions come with Bash pre-installed, while macOS uses a default Bash shell.

Internet Connectivity: Ensure that your system has internet connectivity to access the AWS services and APIs.

Appropriate Permissions: The AWS credentials configured in your system should have the necessary permissions to perform the actions mentioned in the scripts. For example, if the script involves managing EC2 instances, the IAM user/role associated with your credentials should have the necessary EC2 permissions.

Required Tools and Services: Some scripts might rely on specific tools or services to be installed or configured. For example, if a script interacts with Docker, you need to have Docker installed and running on your system. Ensure that you have any required tools or services installed and properly configured.

Proper Configuration: Some scripts use variables like "your-instance-id," "your-bucket-name," or "your-role-arn" as placeholders. Replace these placeholders with the appropriate values for your AWS resources before running the scripts.

Always exercise caution when running scripts that interact with your AWS resources. Ensure that you thoroughly review and understand the scripts' functionality and potential impact before executing them.

#shell script that monitors the CPU, memory, and disk usage of EC2 instances:
=============================================================================

Replace "your-instance-id" with the actual instance ID you want to monitor. The script uses the AWS CLI to retrieve CPU, memory, and disk usage metrics from Amazon CloudWatch for the specified instance.

You'll need to have the AWS CLI installed and configured with the appropriate credentials on the machine where you run the script. The script queries the CloudWatch metrics for the past 5 minutes and calculates the average usage. Adjust the --start-time and --end-time values if you want to monitor a different time range.

You can customize the script further to monitor multiple instances by adding additional instance IDs and calling the calculation functions accordingly.

>>>>>>>>>>> To send a notification to an email address when CPU, memory, or disk utilization reaches 50% or more on an EC2 instance, you can modify the previous script to include the email notification functionality. <<<<<<<<<<<<<<<<

In this updated script, a new function send_notification has been added. This function takes the subject (CPU Usage, Memory Usage, or Disk Usage) and the instance ID as input parameters. If the respective utilization is above 50%, it sends an email notification to the specified email address (pvishva932@gmail.com in this case) using the mail command.

Make sure to have the mail command installed on your system and properly configured to send emails. You may need to set up an email server or configure the mail command to use an external email service.

Remember to modify the email address in the send_notification function to the appropriate recipient address.











