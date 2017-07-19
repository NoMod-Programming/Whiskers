

!ASN1ExplicitContextValue methodsFor: 'parsing' stamp: 'rww 3/25/2007 10:45'!

asn1Tag



	^ self tagIsPrimitive

		ifTrue: [128 bitOr: self tagIndex]

		ifFalse: [160 bitOr: self tagIndex].

! !

