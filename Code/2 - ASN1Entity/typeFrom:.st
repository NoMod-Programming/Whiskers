
!ASN1Entity methodsFor: 'private' stamp: 'rww 3/23/2007 12:37'!
typeFrom: typeSpec

	^ self module
		ifNil: [typeSpec isBehavior
			ifTrue: [typeSpec new]
			ifFalse: [typeSpec]]
		ifNotNil: [self module typeFrom: typeSpec]! !
