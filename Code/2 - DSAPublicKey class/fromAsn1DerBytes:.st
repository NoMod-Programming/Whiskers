
!DSAPublicKey class methodsFor: 'instance creation' stamp: 'rww 10/16/2016 19:51'!
fromAsn1DerBytes: bytes

	| collection algorithm dssSig p q g y |
	collection := ASN1Stream decodeBytes: bytes.
	algorithm := collection first.
	dssSig := algorithm last.
	(dssSig size = 3) ifFalse: [self error: 'incorrect number of dss parameters'].
	p := dssSig at: 1.
	q := dssSig at: 2.
	g := dssSig at: 3.
	y := ASN1Stream decodeBytes: collection last bytes.
	^ DSAPublicKey p: p q: q g: g y: y.
! !
