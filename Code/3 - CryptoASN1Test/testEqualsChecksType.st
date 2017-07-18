
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'cds 7/5/2010 16:22'!
testEqualsChecksType

	self deny: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.8.5') = Object new
! !
