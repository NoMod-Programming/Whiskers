
!RSAPublicKey methodsFor: 'converting' stamp: 'rww 10/16/2016 19:26'!
asX509Asn1DerBytes

	| algorithm keyInfo |
	algorithm := OrderedCollection
		with: (ASN1ObjectId fromString: '1.2.840.113549.1.1.1') 
		with: ASN1Null new.
	keyInfo := OrderedCollection with: algorithm with: (ASN1BitString fromByteArray: self asAsn1DerBytes).
	^ keyInfo asAsn1DerBytes.

! !
