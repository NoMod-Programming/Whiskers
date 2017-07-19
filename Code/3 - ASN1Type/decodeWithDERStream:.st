

!ASN1Type methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:30'!

decodeWithDERStream: derStream



	| tag |

	tag := derStream nextTag.

	(self matchesTag: tag)

		ifFalse: [self error: 'asn1 decoder: bad tag'].

	^ self 

		decodeValueWithDERStream: derStream 

		length: derStream nextLength.

	

! !

