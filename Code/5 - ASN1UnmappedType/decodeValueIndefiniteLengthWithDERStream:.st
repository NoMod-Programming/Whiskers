
!ASN1UnmappedType methodsFor: 'decoding' stamp: 'rww 4/14/2007 11:47'!
decodeValueIndefiniteLengthWithDERStream: derStream

	| coll value |
	coll := self containerClass new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := derStream decode].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] 
		whileFalse: [coll add: value].
	^coll! !
