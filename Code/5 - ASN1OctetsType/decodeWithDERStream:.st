
!ASN1OctetsType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:30'!
decodeWithDERStream: derStream

	| tag numericTag object |
	tag := derStream peekTag.
	numericTag := tag bitAnd: 2r00011111.
	numericTag = (self asn1Tag bitAnd: 2r00011111)
		ifFalse: [self error: 'asn1 decoder: bad tag'].
	derStream nextTag.
	(tag bitAnd: 2r00100000) > 0
		ifTrue: [object := self 
			decodeConstructedValueWithDERStream: derStream 
			length: derStream nextLength]
		ifFalse: [object := self 
			decodeValueWithDERStream: derStream 
			length: derStream nextLength].
	^ object! !
