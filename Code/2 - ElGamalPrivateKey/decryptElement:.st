
!ElGamalPrivateKey methodsFor: 'actions' stamp: 'len 10/26/2002 16:30'!
decryptElement: anArray
	| gamma delta aux |
	gamma := anArray at: 1.
	delta := anArray at: 2.
	aux := gamma raisedTo: (modulo - 1 - secretExponent) modulo: modulo.
	^ aux * delta \\ modulo! !
