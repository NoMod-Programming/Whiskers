
!ProcedureHatBlockMorph methodsFor: 'initialization' stamp: 'EMP 7/17/2017 15:17'!
initialize
	super initialize.
	self removeAllMorphs.
	runningMouse _ false.
	parameterNames _ OrderedCollection new.
	self addMorphBack: ((StringMorph contents: ('define ' localized) font: ((ScratchFrameMorph getFont: #Label))) color: Color white).
	self addMorphBack: (block _ ((AlignmentMorph new color: Color transparent; vResizing: #shrinkWrap; hResizing: #shrinkWrap) addMorphBack: (CustomProcedureHolder new commandSpec: ''; color: (Color r: 99/255 g: 45/255 b: 153/255) lighter))).
	self color: (ScratchViewerMorph colorForCategory: 'More Blocks')! !
