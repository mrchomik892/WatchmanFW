# follow.py
#
# Follow a file like tail -f.
# version 0.2

import time
def follow(thefile):
	thefile.seek(0,2)
	while True:
		line = thefile.readline()
		if not line:
            		time.sleep(0.1)
            		continue
        	yield line
