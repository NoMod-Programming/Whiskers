
!PrimesFinder methodsFor: 'testing' stamp: 'len 10/26/2002 16:24'!
satisfied
	wheel satisfied ifFalse: [^ false].
	^ MillerRabin isProbablyPrime: candidate! !
