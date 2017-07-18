
!ASN1SubType methodsFor: 'testing' stamp: 'rww 3/25/2007 10:28'!
matchesTag: anInteger

	^ ((tag bitXor: anInteger) bitAnd: 2r00011111) isZero
! !
