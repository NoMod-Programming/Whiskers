
!ASN1Module methodsFor: 'services' stamp: 'rww 3/28/2007 05:54'!
add: aType

	| old |
	old := self definitions at: aType name ifAbsent: [nil].
	aType module: self.
	old ifNotNil: [old becomeForward: aType].
	^self definitions at: aType name put: aType.
! !
