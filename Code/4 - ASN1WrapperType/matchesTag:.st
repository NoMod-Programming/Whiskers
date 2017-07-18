
!ASN1WrapperType methodsFor: 'testing' stamp: 'rww 3/29/2007 09:24'!
matchesTag: anInteger

	^ (anInteger bitAnd: 2r11000000) isZero not
! !
