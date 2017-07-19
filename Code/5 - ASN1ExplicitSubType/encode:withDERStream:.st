

!ASN1ExplicitSubType methodsFor: 'encoding' stamp: 'rww 3/25/2007 18:19'!

encode: anObject withDERStream: derStream



	| tempStream |

	derStream nextPutTag: (self asn1Tag bitOr: 160).

	tempStream := derStream newStream.

	self parent encode: anObject withDERStream: tempStream.

	derStream nextPutLength: tempStream size.

	derStream nextPutAll: tempStream contents.

! !

