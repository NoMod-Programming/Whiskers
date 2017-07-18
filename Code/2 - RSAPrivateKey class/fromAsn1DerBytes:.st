
!RSAPrivateKey class methodsFor: 'class initialization' stamp: 'rww 10/12/2016 03:27'!
fromAsn1DerBytes: bytes

	| type |
	type := (ASN1Module name: #RSA) find: #RSAPrivateKey.
	^ ASN1Stream decodeBytes: bytes withType: type.
! !
