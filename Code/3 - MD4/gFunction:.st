

!MD4 methodsFor: 'functions' stamp: 'LC 6/24/2001 15:47'!

gFunction: x 

	^ ((b bitAnd: c)

		bitOr: ((b bitAnd: d)

				bitOr: (c bitAnd: d)))

		+ x + 16r5A827999! !

