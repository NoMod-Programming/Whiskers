
!ElGamalPrivateKey methodsFor: 'actions' stamp: 'cmm 2/15/2006 00:03'!
signMessage: aByteArray
	| hm k kinv r s |
	hm := (self hashFunction hashMessage: aByteArray) asInteger.

	[k := SecureRandom picker nextInt: modulo - 2.
	(k gcd: modulo-1) = 1] whileFalse.

	r := generator raisedTo: k modulo: modulo.
	kinv := k inverseModulo: (modulo-1).
	s := kinv * (hm - (secretExponent*r)) \\ (modulo-1).
	^ Array with: r with: s! !
