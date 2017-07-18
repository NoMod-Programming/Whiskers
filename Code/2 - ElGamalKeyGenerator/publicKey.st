
!ElGamalKeyGenerator methodsFor: 'accessing' stamp: 'cs 8/5/2002 20:00'!
publicKey
	^ ElGamalPublicKey 
		setModulo: p 
		generator: alpha 
		generatorRaisedToA: (alpha raisedTo: a modulo: p)
! !
