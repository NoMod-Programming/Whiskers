

!RSAPublicKey class methodsFor: 'instance creation' stamp: 'rww 10/12/2016 03:26'!

fromAsn1DerBytes: bytes



	| type |

	type := (ASN1Module name: #RSA) find: #RSAPublicKey.

	^ ASN1Stream decodeBytes: bytes withType: type.

! !

