
!PrimesWheel methodsFor: 'initialization' stamp: 'LC 1/16/2002 08:35'!
initialize: n
	self initializePrimes: n.
	residues := (Array new: primes size) atAllPut: 0.
	satisfied := false! !
