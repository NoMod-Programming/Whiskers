
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'len 1/30/1999 06:09'!
q
	q isNil ifTrue: [self computePrimes].
	^ q! !
