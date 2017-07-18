
!ASN1ImplicitSubType methodsFor: 'decoding' stamp: 'rww 4/14/2007 12:23'!
decodeWithDERStream: derStream

	| thisTag |
	thisTag := derStream nextTag.
	(self parent isConstructed not and: [(thisTag bitAnd: 2r00100000) > 0])
		ifTrue: [^ self parent 
			decodeConstructedValueWithDERStream: derStream 
			length: derStream nextLength]
		ifFalse: [^ self parent 
			decodeValueWithDERStream: derStream 
			length: derStream nextLength].
! !
