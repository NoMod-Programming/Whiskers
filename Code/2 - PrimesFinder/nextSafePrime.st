
!PrimesFinder methodsFor: 'accessing' stamp: 'len 10/26/2002 16:27'!
nextSafePrime
	[self += 2. self satisfiedSafe] whileFalse.
	^ 2*candidate + 1! !
