#!/usr/bin/python
import sys
filename = sys.argv[1]
print("Converting {}...".format(filename))
text = open(filename, 'rb').read().replace('\r','\r\n')
open(filename,'wb').write(text)
