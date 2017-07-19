

!ASN1ConstructedType methodsFor: 'encoding' stamp: 'rww 3/27/2007 15:45'!

encode: anObject withDERStream: derStream



	| tempStream |

	derStream nextPutTag: self asn1Tag.

	tempStream := derStream newStream.

	self encodeValue: anObject withDERStream: tempStream.

	derStream nextPutLength: tempStream size.

	derStream nextPutAll: tempStream contents.

	^ derStream

! !

