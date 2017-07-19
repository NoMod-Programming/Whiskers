

!ASN1ExplicitSubType methodsFor: 'decoding' stamp: 'rww 3/29/2007 15:47'!

decodeWithDERStream: derStream owner: owner ownerType: ownerType



	derStream nextTag.

	derStream nextLength.

	^ self parent decodeWithDERStream: derStream owner: owner ownerType: ownerType.

! !

