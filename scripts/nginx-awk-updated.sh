#!/bin/bash
#
# SCRIPT: nginx-awk
# AUTHOR: Manas Kashyap
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu 18.04
# 
# PURPOSE: Using awk, to store nginx log's "get" values in a different output file AND also print the Ip addresses through which the request was thrown.
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #
################################################################

logFilePath="/var/log/nginx/access.log"
today=$(date)
################################################################
#          Define Functions here                               #
################################################################

# print_nginx_info(){
# 	echo -e "------------- $today ------------- \n"
# 	awk '/GET/{print}' $logFilePath >> nginxLogGETInfo.txt
# }

# displayIPs() {
# 	echo -e "\n all the IPs through which the request is thrown on $today are : "
# 	awk '{print $1}' nginxLogGETInfo.txt >> iphits.txt
# 	cat iphits.txt
# }

getIPs(){
	echo -e "------------- $today ------------- \n"
	echo
	awk '/GET/{print}' $logFilePath | awk '{print $1}' 
}

################################################################
#          Beginning of Main                                   #
################################################################

# print_nginx_info
# displayIPs
getIPs
# End of script
