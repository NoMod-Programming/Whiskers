
!ASN1ObjectId class methodsFor: 'asn' stamp: 'rww 1/1/2003 13:22'!
fromString: oidString

	^ self new
		oid: oidString;
		initializeDescription;
		yourself! !
