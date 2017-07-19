

!MD4 methodsFor: 'copying' stamp: 'LC 6/24/2001 15:51'!

copy4: u to: anArray startingAt: n

	anArray

		at: n put: (u bitAnd: 16rFF);

		at: n + 1 put: (u >> 8 bitAnd: 16rFF);

		at: n + 2 put: (u >> 16 bitAnd: 16rFF);

		at: n + 3 put: (u >> 24 bitAnd: 16rFF)! !

