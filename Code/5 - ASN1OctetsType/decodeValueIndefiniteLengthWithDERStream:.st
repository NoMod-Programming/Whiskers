
!ASN1OctetsType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:36'!
decodeValueIndefiniteLengthWithDERStream: derStream

	| octets value |
	octets := self octetsClass new.
	[derStream peekTag = 0
		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]
		ifFalse: [value := self decodeWithDERStream: derStream].
	value isKindOf: ASN1EndOfIndefiniteLengthMarker] whileFalse: [
		octets := octets, value].
	^ octets! !
