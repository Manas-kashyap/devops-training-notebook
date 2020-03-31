#!/bin/bash
#
# SCRIPT: function-demo
# AUTHOR: Manas Kashyap
# DATE:   27/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: ubuntu
# 
# PURPOSE: Demo for functions.
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
# set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #
################################################################

################################################################
#          Define Functions here                               #
function displayDetails()
{
	echo "Hey ! I was in displayDetails"
	echo $1 $2
}

function toReturnValue()
{
	echo "I am returning a value."
	return 5
}

################################################################

################################################################
#          Beginning of Main                                   #
displayDetails "Manas Kashyap" 1
toReturnValue 
echo $?
################################################################
# End of script