

!ASN1StringType methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:11'!

encodeValue: anObject withDERStream: derStream



	derStream nextPutAll: anObject asByteArray! !

