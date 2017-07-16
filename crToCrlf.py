import sys
filename = sys.argv[1]
text = open(filename, 'rb').read().replace('\r','\r\n')
open(filename,'wb').write(text)
