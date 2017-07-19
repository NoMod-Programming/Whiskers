

!ASN1Type methodsFor: 'testing' stamp: 'rww 3/25/2007 10:27'!

matchesTag: anInteger



	^((self asn1Tag bitXor: anInteger) bitAnd: 2r00011111) isZero! !

