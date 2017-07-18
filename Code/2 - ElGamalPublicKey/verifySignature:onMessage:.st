
!ElGamalPublicKey methodsFor: 'actions' stamp: 'len 10/26/2002 16:31'!
verifySignature: anArray onMessage: aByteArray
	| hm r s v1 v2 |
	hm := (self hashFunction hashMessage: aByteArray) asInteger.
	r := anArray at: 1.
	s := anArray at: 2.
	(r between: 1 and: modulo-1) ifFalse: [^ false]. "signature rejected"

	v1 := generatorRaisedToA raisedTo: r modulo: modulo.
	v1 := v1 * (r raisedTo: s modulo: modulo) \\ modulo.
	v2 := generator raisedTo: hm modulo: modulo.
	^ v1 = v2  "signature accepted if v1=v2"! !
