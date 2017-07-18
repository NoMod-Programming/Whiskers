
!PrimesFinder methodsFor: 'accessing' stamp: 'len 10/25/2002 15:13'!
nextPrime
	[self += 2. self satisfied] whileFalse.
	^ candidate! !
