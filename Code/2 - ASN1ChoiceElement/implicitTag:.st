

!ASN1ChoiceElement methodsFor: 'subtype utilities' stamp: 'rww 3/24/2007 10:39'!

implicitTag: integer



	self type: self type implicitSubType.

	^ self type tag: integer.

! !

