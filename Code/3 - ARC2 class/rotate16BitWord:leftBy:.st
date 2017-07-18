
!ARC2 class methodsFor: 'support' stamp: 'RJT 3/30/2007 10:48'!
rotate16BitWord: a16BitWord leftBy: bitCount
	| s1 s2 aBitCount |
	aBitCount := bitCount \\ 16.
	aBitCount < 0 ifTrue: [aBitCount := aBitCount + 16].
	s1 := aBitCount.
	s2 := s1 - 16.
	^((a16BitWord bitShift: s1) bitAnd: 16rFFFF) bitOr: (a16BitWord bitShift: s2).! !
