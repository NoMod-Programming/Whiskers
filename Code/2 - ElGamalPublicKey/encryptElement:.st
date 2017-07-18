
!ElGamalPublicKey methodsFor: 'actions' stamp: 'cmm 2/15/2006 00:03'!
encryptElement: anInteger
	| k gamma delta |
	k := SecureRandom picker nextInt: modulo-2.
	gamma := generator raisedTo: k modulo: modulo.
	delta := anInteger * (generatorRaisedToA raisedTo: k modulo: modulo) \\ modulo.
	^ Array with: gamma with: delta! !
