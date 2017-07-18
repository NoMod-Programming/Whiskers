
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'dik 9/28/2010 14:02'!
qInv

	^qInv ifNil: [ "qInv = 1 / q mod p"
		qInv := (EuclidAlgorithm with: q with: p) doBasicAlgorithm; firstCoefficient.
		qInv < 0 ifTrue: [ qInv := qInv \\ p ].
		qInv ]! !
