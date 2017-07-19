

!RSAKeyPairGenerator methodsFor: 'private' stamp: 'len 11/13/2002 13:17'!

findPrime

	^ PrimesFinder primeOfSize: bits // 2! !

