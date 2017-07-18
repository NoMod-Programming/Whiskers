
!PrimesFinder class methodsFor: 'primes generation' stamp: 'len 10/26/2002 16:27'!
safePrimeOfSize: numberOfBits
	^ (self bits: numberOfBits) nextSafePrime! !
