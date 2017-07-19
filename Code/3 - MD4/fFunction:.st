

!MD4 methodsFor: 'functions' stamp: 'LC 10/26/2001 19:23'!

fFunction: x 

	^ ((b bitAnd: c)

		bitOr: (b bitInvert bitAnd: d))

		+ x! !

