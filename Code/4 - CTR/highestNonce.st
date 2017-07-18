
!CTR methodsFor: 'private' stamp: 'cmm 12/2/2006 16:41'!
highestNonce
	^ (1 bitShift: self nonceBits) - 1! !
