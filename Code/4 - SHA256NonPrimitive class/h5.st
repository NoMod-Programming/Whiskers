
!SHA256NonPrimitive class methodsFor: 'constants' stamp: 'ul 3/5/2008 03:07'!
h5
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r9B05688C! !
