
!SecureRandom methodsFor: 'accessing' stamp: 'cmm 5/4/2006 00:18'!
nextBytes: byteLength
	^ (self nextBits: byteLength*8) asByteArray! !
