
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 15:18'!
spec: specString
	| temp |
	spec _ specString.
	(temp _ self nextBlock).
	self removeAllMorphs.
	self addMorphBack: ((StringMorph contents: ('define ' localized) font: ((ScratchFrameMorph getFont: #Label))) color: Color white).
		self addMorphBack: (block _ ((AlignmentMorph new color: Color transparent; vResizing: #shrinkWrap; hResizing: #shrinkWrap) addMorphBack: (CustomProcedureHolder new parameterNames: parameterNames; commandSpec: specString; color: (Color r: 89/255 g: 71/255 b:177/255) lighter))).
	temp ifNotNil: [self addMorphBack: temp].! !
