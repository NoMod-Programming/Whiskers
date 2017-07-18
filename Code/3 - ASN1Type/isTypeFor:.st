
!ASN1Type methodsFor: 'testing' stamp: 'rww 3/25/2007 17:07'!
isTypeFor: anObject

	^((self asn1Tag bitXor: anObject asn1Tag) bitAnd: 2r00011111) isZero! !
