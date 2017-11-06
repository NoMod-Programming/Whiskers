
!VariableArgMorph methodsFor: 'initialize' stamp: 'EMP 11/5/2017 18:16'!
initialize

	super initialize.
	self borderInset.
	self borderWidth: 1.
	self color: Color white.

	labelMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #Arg);
		color: Color white;
		lock.
	self addMorph: labelMorph.
	((labelMorph extent y) > 15)
		ifTrue: [ self extent: 20@((labelMorph extent y) + 3) ]
		ifFalse: [ self extent: 20@15 ].
	menuIconMorph := ImageMorph new image: DropDownMenuForm.
	self addMorphFront: menuIconMorph.

	morph := nil.
	self updateLabel.
! !
