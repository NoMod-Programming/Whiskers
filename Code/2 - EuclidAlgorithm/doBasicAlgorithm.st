
!EuclidAlgorithm methodsFor: 'as yet unclassified' stamp: 'dik 9/28/2010 14:00'!
doBasicAlgorithm
	| u1 a1 b1 q r |
	u := 1. u1 := 0. a1 := a. b1 := b.
	[b1 = 0]
		whileFalse: 
			[q := a1 // b1.
			r := a1 - (b1 * q).
			u1 := u - (q * (u := u1)).
			a1 := b1.
			b1 := r].
	gcd := a1.
	v := b = 0
			ifTrue: [b]
			ifFalse: [gcd - (u * a) // b]! !
