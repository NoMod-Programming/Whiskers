
!ProcedureHatBlockMorph methodsFor: 'initialization' stamp: 'EMP 7/18/2017 16:19'!
initialize
	super initialize.
	self removeAllMorphs.
	runningMouse _ false.
	parameterNames _ OrderedCollection new.
	self addMorphBack: ((StringMorph contents: ('define ' localized) font: ((ScratchFrameMorph getFont: #Label))) color: Color white).
	self addMorphBack: (block _ ((AlignmentMorph new color: Color transparent; vResizing: #shrinkWrap; hResizing: #shrinkWrap) addMorphBack: (CustomProcedureHolder new commandSpec: ''; color: (ScratchViewerMorph colorForCategory: 'More Blocks')))).
	self color: (ScratchViewerMorph colorForCategory: 'More Blocks')! !
