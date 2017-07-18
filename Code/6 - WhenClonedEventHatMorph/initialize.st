
!WhenClonedEventHatMorph methodsFor: 'initialization' stamp: 'EMP 7/17/2017 17:02'!
initialize

	| parts s |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when I start as a clone'.

	s := StringMorph new contents: parts first; font: (ScratchFrameMorph getFont: #Label); color: Color white; lock.
	self addMorphBack: s.! !
