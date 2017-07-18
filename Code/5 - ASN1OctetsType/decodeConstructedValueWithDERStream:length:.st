
!ASN1OctetsType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:36'!
decodeConstructedValueWithDERStream: derStream length: length

	| octets stopPosition |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	octets := self octetsClass new.
	stopPosition := derStream position + length.
	[derStream position < stopPosition] whileTrue: [
		octets := octets, (self decodeWithDERStream: derStream)].
	^ octets! !
