
!RSAKeyPairGenerator methodsFor: 'accessing' stamp: 'rww 9/28/2010 07:00'!
publicKey
	^ RSAPublicKey exponent: self e modulo: self p * self q! !
