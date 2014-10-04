 #!/bin/sh
 # shell script to prepend i3status with more stuff
 
      i3status | while :
        do
			read line
			echo "`amixer sget Master | tail -n1 | awk '{if ($6 == "[on]") print " " $4 ; else print ""}'` | $line" || exit 1
		done
			
