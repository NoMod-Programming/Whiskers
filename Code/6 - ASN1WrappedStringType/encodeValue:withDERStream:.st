
!ASN1WrappedStringType methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:13'!
encodeValue: anObject withDERStream: derStream

	derStream nextPutAll: anObject string asByteArray! !
