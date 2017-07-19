

!RSAPublicKey methodsFor: 'converting' stamp: 'rww 10/12/2016 03:26'!

asAsn1DerBytes



	| type |

	type := (ASN1Module name: #RSA) find: #RSAPublicKey.

	^ ASN1Stream encode: self withType: type

! !

