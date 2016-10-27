 #!/bin/sh
 # shell script to prepend i3status with more stuff
 
      i3status | while :
        do
			read line
			echo "`pamixer --get-mute  | awk '{if ($1 == "false") print " " ; else print ""}'` `pamixer --get-volume` | $line" || exit 1
		done
			
