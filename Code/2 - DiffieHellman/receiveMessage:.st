
!DiffieHellman methodsFor: 'protocol' stamp: 'cs 8/21/2002 12:20'!
receiveMessage: anInteger
	sharedKey := anInteger raisedTo: secret modulo: prime.
	^ sharedKey! !
