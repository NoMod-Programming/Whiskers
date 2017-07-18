
!DiffieHellman methodsFor: 'protocol' stamp: 'hh 7/11/2017 12:36'!
sendMessage
	secret := (SecureRandom withGeneratedKey nextBits: (prime size * 8)) * 2 + 1.
	^ generator raisedTo: secret modulo: prime! !
