
!CTR methodsFor: 'accessing' stamp: 'cmm 5/11/2006 17:31'!
nonce
	^ vector
		uint: self nonceBits
		at: self positionOfNonce! !
