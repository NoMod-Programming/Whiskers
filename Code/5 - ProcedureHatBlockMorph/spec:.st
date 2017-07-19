
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/18/2017 16:19'!
spec: specString
	| temp |
	spec _ specString.
	(temp _ self nextBlock).
	self removeAllMorphs.
	self addMorphBack: ((StringMorph contents: ('define ' localized) font: ((ScratchFrameMorph getFont: #Label))) color: Color white).
		self addMorphBack: (block _ ((AlignmentMorph new color: Color transparent; vResizing: #shrinkWrap; hResizing: #shrinkWrap) addMorphBack: (CustomProcedureHolder new parameterNames: parameterNames; commandSpec: specString; color: (ScratchViewerMorph colorForCategory: 'More Blocks')))).
	temp ifNotNil: [self addMorphBack: temp].
	self doBlockLayout.! !
