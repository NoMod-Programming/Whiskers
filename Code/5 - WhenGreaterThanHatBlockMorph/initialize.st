
!WhenGreaterThanHatBlockMorph methodsFor: 'initialization' stamp: 'EMP 7/16/2017 21:47'!
initialize

	| s1 s2 |
	super initialize.
	lastState _ false.
	lastArg _ nil.
	argMorph _ (ExpressionArgMorph new).
	secondArgMorph _ (ChoiceArgMorph new choice: 'loudness'; options: #('timer' 'loudness'); color: color).
	lastState _ false.

	s1 _ 'when' localized.
	s2 _ '>' localized.
	self removeAllMorphs.
	self addMorphBack: ((StringMorph contents: s1 font: (ScratchFrameMorph getFont: #Label)) color: Color white).
	self addMorphBack: secondArgMorph.
	self addMorphBack: ((StringMorph contents: s2 font: (ScratchFrameMorph getFont: #Label)) color: Color white).
	self addMorphBack: argMorph! !
