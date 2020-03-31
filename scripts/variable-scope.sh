#!/bin/bash
#
# SCRIPT: variable-scope
# AUTHOR: Manas
# DATE:   27/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: ubuntu
# 
# PURPOSE: Explain variable scope.
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

outerVariableOne="Global 1"
outerVariableTwo="Global 2"

################################################################
#          Define Functions here                               #

localGlobalDemo(){
	local outerVariableOne="Changed to Local 1"
	echo "Inside localGlobalDemo : $outerVariableOne $outerVariableTwo"
	outerVariableOne="Changed 1"
	outerVariableTwo="Changed 2"
}

################################################################
################################################################
#          Beginning of Main                                   #
echo "Inside main : $outerVariableOne $outerVariableTwo"
localGlobalDemo
echo "Inside main again : $outerVariableOne $outerVariableTwo"

################################################################
# End of script