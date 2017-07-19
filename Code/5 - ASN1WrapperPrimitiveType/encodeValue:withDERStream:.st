

!ASN1WrapperPrimitiveType methodsFor: 'encoding' stamp: 'rww 3/25/2007 20:27'!

encodeValue: anObject withDERStream: derStream



	derStream nextPutAll: anObject tagValue.

! !

