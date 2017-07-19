

!ASN1ByteArrayType methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:06'!

encodeValue: anObject withDERStream: derStream



	derStream nextPutAll: anObject! !

