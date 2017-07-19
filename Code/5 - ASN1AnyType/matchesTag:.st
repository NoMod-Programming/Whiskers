

!ASN1AnyType methodsFor: 'testing' stamp: 'rww 3/27/2007 16:46'!

matchesTag: anInteger



	^ (anInteger bitAnd: 2r11000000) isZero

! !

