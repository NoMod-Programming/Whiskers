
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'len 2/1/1999 09:12'!
computePrimes
	[p := self findPrime. p - 1 \\ self e = 0] whileTrue.
	[q := self findPrime. p - 1 * (q - 1) \\ self e = 0] whileTrue! !
