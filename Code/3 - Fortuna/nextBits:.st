
!Fortuna methodsFor: 'accessing' stamp: 'cmm 1/4/2007 23:55'!
nextBits: anInteger 
	| firstBits bits8 |
	firstBits := (self nextBytes: anInteger // 8) 
		uint: (bits8 := anInteger truncateTo: 8)
		at: 1.
	^ bits8 = anInteger 
		ifTrue: [ firstBits ]
		ifFalse: 
			[ | last8 mask bitsNeeded |
			last8 := self nextBytes: 1.
			bitsNeeded := anInteger - bits8.
			mask := ((1 to: bitsNeeded) 
				inject: 0
				into: [ : total : n | 1 bitShift: n ]) - 1.
			(firstBits bitShift: bitsNeeded) + (last8 first bitAnd: mask) ]! !
