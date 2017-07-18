
!ASN1ConstructedType methodsFor: 'encoding' stamp: 'acp 5/3/2017 21:07'!
decodeWithDERStream: derStream

	derStream nextTag.
	^ self decodeValueWithDERStream: derStream length: derStream nextLength.
! !
