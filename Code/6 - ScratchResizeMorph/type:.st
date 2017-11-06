
!ScratchResizeMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 16:41'!
type: aSymbol

	type := aSymbol.
	(type = #edge)
	ifTrue: [
		self addMorphBack: (AlignmentMorph newSpacer: Color transparent).
		self addMorphFront: (AlignmentMorph newSpacer: Color transparent)]
	ifFalse: [
		self addMorphFront: (AlignmentMorph newSpacer: Color transparent)]
! !
