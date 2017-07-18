
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'len 1/30/1999 06:09'!
p
	p isNil ifTrue: [self computePrimes].
	^ p! !
