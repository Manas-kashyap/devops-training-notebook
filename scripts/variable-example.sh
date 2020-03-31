#!/bin/bash
#
# SCRIPT: variable-example
# AUTHOR: Manas
# DATE:   27/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: ubuntu
# 
# PURPOSE: Explain usage of variables
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

myfirstname='Manas'
mysecondname=Kashyap
echo $myfirstname $mysecondname

myjob="I am an Intern."
echo
echo $myjob

export myfirstname
./export-variable-script.sh

################################################################
#          Define Functions here                               #
################################################################
################################################################
#          Beginning of Main                                   #
################################################################
# End of script




