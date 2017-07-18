
!PrimesFinder class methodsFor: 'instance creation' stamp: 'cmm 2/15/2006 00:02'!
bits: numberOfBits
	| shift b |
	shift := numberOfBits - 1.
	b := (SecureRandom picker nextBits: shift)+1.
	b := b bitOr: 1. "ensure it is odd"
	b := b bitOr: (1 << shift). "ensure it is of the requiered length"
	^ self candidate: b! !
