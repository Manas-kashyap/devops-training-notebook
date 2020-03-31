#!/bin/bash
#
# SCRIPT: nginx-sed
# AUTHOR: Manas Kashyap
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu 18.04
# 
# PURPOSE: Using sed, to store nginx log's "get" values in a different output file AND also print the Ip addresses through which the request was thrown.
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

#nginxlogsed=$(sed '/GET/' $logFilePath)

################################################################
#          Define Functions here                               #
################################################################

# print_nginx_info(){
# 	#sed '/GET/' $logFilePath > nginxlogSedInfo.txt
# 	#cat nginxlogSedInfo.txt

# 	sed -n '/GET/p' $logFilePath > nginxlogSedInfo.txt
# 	cat nginxlogSedInfo.txt
# }

# displayIPs() {
# 	echo -e "\n all the IPs through which the request is thrown on $today are : "
# 	#awk '{print $1}' nginxlogSedInfo.txt >> iphits.txt
# 	#sed -r '/"[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}"/' nginxlogSedInfo.txt

# 	#sed 's/.*\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*/\1/' nginxlogSedInfo.txt
# 	#cat iphitsSed.txt
	
# 	sed -n 's/.*\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*/\1/1p' nginxlogSedInfo.txt

# 	#sed -n 's/.*\([0-9][0-9]*G[0-9][0-9]*\).*/\1/p' nginxlogSedInfo.txt
# 	rm nginxlogSedInfo.txt
# }

getIPHits(){
	sed -n '/GET/p' $logFilePath | sed -n 's/.*\(\(\(^\| \)[0-9]\{1,3\}\.\)\{1\}\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}\) .*/\1/gp'
}

################################################################
#          Beginning of Main                                   #
################################################################

# print_nginx_info
# displayIPs
getIPHits
# End of script
