
!MillerRabin methodsFor: 'computing' stamp: 'cmm 2/15/2006 00:06'!
iterate
	| b t x |
	iterations := iterations + 1.
	b := SecureRandom picker nextInt: samples.
	(target gcd: b) = 1 ifFalse: [^ satisfied := false].
	t := 0.
	x := b raisedTo: n0 modulo: target.
	(x = 1 or: [x = minusOne]) ifFalse: [
		[x := x squared \\ target.
		t := t + 1.
		satisfied := x = minusOne.
		satisfied not and: [t < k]] whileTrue.
		satisfied ifFalse: [^ satisfied]]
! !
