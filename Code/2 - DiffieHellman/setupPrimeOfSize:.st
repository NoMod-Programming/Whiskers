
!DiffieHellman methodsFor: 'initialization' stamp: 'len 10/25/2002 13:45'!
setupPrimeOfSize: bits
	prime := PrimesFinder safePrimeOfSize: bits.
	generator := ElGamalKeyGenerator generatorOfZp: prime! !
