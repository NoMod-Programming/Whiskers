
!ASN1Module methodsFor: 'services' stamp: 'rww 3/23/2007 12:35'!
remove: aType

	self definitions removeKey: aType name.
	aType module: nil.
	^aType! !
