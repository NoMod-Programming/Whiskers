

!ASN1ExplicitSubType methodsFor: 'decoding' stamp: 'rww 3/26/2007 05:32'!

decodeWithDERStream: derStream



	derStream nextTag.

	derStream nextLength.

	^ self parent decodeWithDERStream: derStream.

! !

