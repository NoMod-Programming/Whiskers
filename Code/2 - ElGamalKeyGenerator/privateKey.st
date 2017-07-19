

!ElGamalKeyGenerator methodsFor: 'accessing' stamp: 'cs 8/5/2002 20:02'!

privateKey

	^ ElGamalPrivateKey 

		setModulo: p 

		generator: alpha

		secretExponent: a

! !

