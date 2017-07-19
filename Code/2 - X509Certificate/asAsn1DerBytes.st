

!X509Certificate methodsFor: 'converting' stamp: 'rww 10/16/2016 19:28'!

asAsn1DerBytes



	| type |

	type := (ASN1Module name: #x509) find: #Certificate.

	^ ASN1Stream encode: self withType: type

! !

