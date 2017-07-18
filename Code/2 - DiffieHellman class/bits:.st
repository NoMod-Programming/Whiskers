
!DiffieHellman class methodsFor: 'instance creation' stamp: 'len 10/26/2002 16:06'!
bits: anInteger
	| prime generator |
	prime := PrimesFinder safePrimeOfSize: anInteger.
	generator := ElGamalKeyGenerator generatorOfZp: prime.
	^ self prime: prime generator: generator! !
