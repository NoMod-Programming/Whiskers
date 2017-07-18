
!ASN1AnyDefinedByType methodsFor: 'encoding' stamp: 'rww 3/27/2007 16:43'!
encode: anObject withDERStream: derStream owner: owner ownerType: ownerType

	| keyValue type |
	keyValue := (ownerType elementWithSymbol: self definedBy)
		valueFrom: owner.
	type := self at: keyValue.
	^ type encode: anObject withDERStream: derStream.
! !
