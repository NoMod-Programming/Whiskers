
!X509Certificate class methodsFor: 'instance creation' stamp: 'rww 10/16/2016 19:57'!
fromAsn1DerBytes: bytes

	| type |
	type := (ASN1Module name: #x509) find: #Certificate.
	^ ASN1Stream decodeBytes: bytes withType: type.
! !
