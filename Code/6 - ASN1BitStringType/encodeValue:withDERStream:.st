
!ASN1BitStringType methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:03'!
encodeValue: anObject withDERStream: derStream

	derStream 
		nextPut: anObject bitsPadding;
		nextPutAll: anObject bytes asByteArray.
! !
