

!ASN1Type methodsFor: 'encoding' stamp: 'rww 3/27/2007 15:45'!

encode: anObject withDERStream: derStream



	| size |

	derStream nextPutTag: anObject asn1Tag.

	size := self sizeOfObject: anObject.

	derStream nextPutLength: size.

	self encodeValue: anObject withDERStream: derStream.

	^ derStream

! !

