
!ASN1AnyDefinedByType methodsFor: 'decoding' stamp: 'rww 3/27/2007 16:43'!
decodeWithDERStream: derStream owner: owner ownerType: ownerType

	| keyValue type |
	keyValue := (ownerType elementWithSymbol: self definedBy)
		valueFrom: owner.
	type := self at: keyValue.
	^ type decodeWithDERStream: derStream.
! !
