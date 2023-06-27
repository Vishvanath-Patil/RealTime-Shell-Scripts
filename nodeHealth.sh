#####################################
# Author : Vishvanath Patil
# Date : 27-06-2023
# This script monitor the system Health 
# version : v1
######################################


set -x #debug mode
set -e # exit the sript if there is an error 
set -o pipefail

df -h

free -g

nproc

ps -ef | grep root | awk -F " " '{print 2$}'
