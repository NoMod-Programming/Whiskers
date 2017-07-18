
!RSAPublicKey methodsFor: 'process' stamp: 'len 8/3/2002 21:50'!
crypt: anInteger
	^ anInteger raisedTo: exponent modulo: modulo! !
