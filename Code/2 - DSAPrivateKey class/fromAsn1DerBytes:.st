
!DSAPrivateKey class methodsFor: 'instance creation' stamp: 'rww 10/16/2016 19:50'!
fromAsn1DerBytes: bytes

	| collection algorithm dssSig p q g x |
	collection := ASN1Stream decodeBytes: bytes.
	algorithm := collection first.
	dssSig := algorithm last.
	(dssSig size = 3) ifFalse: [self error: 'incorrect number of dss parameters'].
	p := dssSig at: 1.
	q := dssSig at: 2.
	g := dssSig at: 3.
	x := ASN1Stream decodeBytes: collection last bytes.
	^ DSAPrivateKey p: p q: q g: g x: x.
! !
