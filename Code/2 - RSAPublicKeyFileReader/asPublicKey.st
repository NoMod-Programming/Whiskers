
!RSAPublicKeyFileReader methodsFor: 'converting' stamp: 'rww 9/28/2010 07:00'!
asPublicKey

	| asn1 |
	asn1 := self asASN1Value.
	^ RSAPublicKey exponent: (asn1 at: 2) modulo: (asn1 at: 1)! !
