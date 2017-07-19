

!MD4 methodsFor: 'functions' stamp: 'LC 6/24/2001 15:47'!

hFunction: x 

	^ ((b bitXor: c)

		bitXor: d)

		+ x + 16r6ED9EBA1! !

