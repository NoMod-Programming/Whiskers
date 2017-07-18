
!ElGamalKeyGenerator methodsFor: 'private' stamp: 'cmm 2/15/2006 00:04'!
generateKeysOfSize: numberOfBits
	p := PrimesFinder safePrimeOfSize: numberOfBits.
	alpha := self class generatorOfZp: p.
	a := SecureRandom picker nextInt: p-2! !
