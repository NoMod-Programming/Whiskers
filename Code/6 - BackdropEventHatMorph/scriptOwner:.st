
!BackdropEventHatMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 19:46'!
scriptOwner: scriptOwner
	super scriptOwner: scriptOwner.
	scriptNameMorph delete.
	scriptNameMorph := ChoiceArgMorph new
		getOptionsSelector: #backdropNames;
		choice: (scriptOwner backdropNames first).
	self addMorphBack: scriptNameMorph.! !
