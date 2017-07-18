
!CTR methodsFor: 'accessing' stamp: 'cmm 5/11/2006 22:37'!
nonce: anInteger
	vector
		uint: self nonceBits
		at: self positionOfNonce
		put: anInteger.
	self counter: 0! !
