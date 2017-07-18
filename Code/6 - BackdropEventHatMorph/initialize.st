
!BackdropEventHatMorph methodsFor: 'initialization' stamp: 'EMP 7/16/2017 19:42'!
initialize

	| parts s |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when backdrop switches to %m.backdrop'.

	s := StringMorph new
		contents: parts first; font: (ScratchFrameMorph getFont: #Label);
		color: Color white;
		lock.
	self addMorphBack: s.

	scriptNameMorph := ChoiceArgMorph new
		getOptionsSelector: #backdropNames;
		options: ScriptableScratchMorph new keyNames;
		choice: 'backdrop1'.
	self addMorphBack: scriptNameMorph.

	s := s fullCopy contents: parts second.
	self addMorphBack: s.
! !
