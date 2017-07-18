
!ASN1StructureElement methodsFor: 'testing' stamp: 'rww 3/23/2007 20:54'!
hasDefaultOrIsOptional

	^ self default notNil or: [ self optional ]! !
