
!Pkcs8PrivateKeyInfo methodsFor: 'api' stamp: 'rww 9/28/2010 07:00'!
asPrivateKey

	| asn1 |
	asn1 := ASN1Stream decodeBytes: self privateKey.
	(asn1 at: 1) > 0
		ifTrue: [^ RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 1)]
		ifFalse: [^ RSAPrivateKey 
			p: (asn1 at: 5) 
			q: (asn1 at: 6) 
			dP: (asn1 at: 7) 
			dQ: (asn1 at: 8) 
			qInv: (asn1 at: 9)]! !