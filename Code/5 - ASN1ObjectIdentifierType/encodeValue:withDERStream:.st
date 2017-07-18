
!ASN1ObjectIdentifierType methodsFor: 'encoding' stamp: 'rww 3/25/2007 11:50'!
encodeValue: anObject withDERStream: derStream

	| bytes |
	bytes := anObject asByteArray.
	derStream nextPutAll: bytes.
	^ derStream
! !
