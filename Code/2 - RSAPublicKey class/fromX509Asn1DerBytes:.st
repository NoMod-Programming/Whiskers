
!RSAPublicKey class methodsFor: 'instance creation' stamp: 'rww 10/14/2016 06:05'!
fromX509Asn1DerBytes: bytes

	| collection algorithm |
	collection := ASN1Stream decodeBytes: bytes.
	algorithm := collection first.
	^ RSAPublicKey fromAsn1DerBytes: collection last bytes.
! !
