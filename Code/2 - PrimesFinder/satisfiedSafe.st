
!PrimesFinder methodsFor: 'testing' stamp: 'len 10/26/2002 16:26'!
satisfiedSafe
	wheel satisfiedSafe ifFalse: [^ false].
	^ (MillerRabin isProbablyPrime: candidate)
		and: [MillerRabin isProbablyPrime: 2*candidate+1]! !
