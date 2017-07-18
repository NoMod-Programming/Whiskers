
!MillerRabin methodsFor: 'computing' stamp: 'cmm 2/15/2006 00:06'!
reset
	iterations := 0.
	satisfied := true.
	minusOne := target - 1.
	samples := minusOne.
	k := minusOne lowBit - 1.
	n0 := minusOne bitShift: k negated! !
