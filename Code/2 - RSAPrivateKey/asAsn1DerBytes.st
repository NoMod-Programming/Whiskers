
!RSAPrivateKey methodsFor: 'converting' stamp: 'rww 10/12/2016 03:27'!
asAsn1DerBytes

	| type |
	type := (ASN1Module name: #RSA) find: #RSAPrivateKey.
	^ ASN1Stream encode: self withType: type
! !
