#!/bin/bash
#
# SCRIPT: GET request
# AUTHOR: Manas Kashyap
# DATE:   26-03-2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu 18.04.4
# 
# PURPOSE: For displaying ngnix get requests with the IP address .
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
input="/var/log/nginx/access.log"
now=$(date)
getRequest=$(cat $input |  grep GET)
################################################################
#          Define Functions here                               #
################################################################
# startNginx () {
# 	systemctl start nginx
# }

writeLogsToFile () {
	echo $now >> output.txt
	echo "=========================================" >> output.txt
	echo $getRequest >> output.txt
	
}
ipAddr () {
	echo "=========================================" >> output.txt
	awk -F "http://" '{print $2}' $input | awk -F "/" '{print $1}' >> output.txt
	rm tempFile.txt
}
#
################################################################
#          Beginning of Main                                   #
################################################################
#startNginx
writeLogsToFile
ipAddr
echo "=========================================" >> output.txt
# End of script
