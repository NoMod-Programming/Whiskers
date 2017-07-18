
!ASN1ChoiceElement methodsFor: 'subtype utilities' stamp: 'rww 3/24/2007 10:39'!
explicitTag: integer

	self type: self type explicitSubType.
	^ self type tag: integer.
! !
