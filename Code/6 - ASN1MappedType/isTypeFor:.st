

!ASN1MappedType methodsFor: 'testing' stamp: 'rww 3/26/2007 09:40'!

isTypeFor: anObject



	^ self mapping notNil 

		ifTrue: [anObject isKindOf: self mapping]

		ifFalse: [anObject asn1Tag = self tag]

! !

